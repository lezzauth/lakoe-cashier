import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:lakoe_pos/common/widgets/form/search_field.dart';

const Duration debounceDuration = Duration(milliseconds: 500);

class PinpointAutocomplete extends StatefulWidget {
  const PinpointAutocomplete({super.key});

  @override
  State<PinpointAutocomplete> createState() => _PinpointAutocompleteState();
}

class _PinpointAutocompleteState extends State<PinpointAutocomplete> {
  String? _currentQuery;

  // The most recent options received from the API.
  late Iterable<Location> _lastOptions = <Location>[];

  late final _Debounceable<Iterable<Location>?, String> _debouncedSearch;

  // Calls the "remote" API to search with the given query. Returns null when
  // the call has been made obsolete.
  Future<Iterable<Location>?> _search(String query) async {
    _currentQuery = query;

    // In a real application, there should be some error handling here.
    final Iterable<Location> options =
        _currentQuery == null ? [] : await locationFromAddress(_currentQuery!);

    // If another search happened after this one, throw away these options.
    if (_currentQuery != query) {
      return null;
    }
    _currentQuery = null;

    return options;
  }

  @override
  void initState() {
    super.initState();
    _debouncedSearch = _debounce<Iterable<Location>?, String>(_search);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white,
      ),
      child: Autocomplete<Location>(
        optionsBuilder: (TextEditingValue textEditingValue) async {
          final Iterable<Location>? options =
              await _debouncedSearch(textEditingValue.text);
          if (options == null) {
            return _lastOptions;
          }
          _lastOptions = options;
          return options;
        },
        onSelected: (Location selection) {
          debugPrint('You just selected $selection');
        },
        fieldViewBuilder:
            (context, textEditingController, focusNode, onFieldSubmitted) =>
                SearchField(
          controller: textEditingController,
          focusNode: focusNode,
          onSubmitted: (p0) => onFieldSubmitted(),
        ),
        displayStringForOption: (option) =>
            "${option.latitude} | ${option.longitude}",
      ),
    );
  }
}

typedef _Debounceable<S, T> = Future<S?> Function(T parameter);

/// Returns a new function that is a debounced version of the given function.
///
/// This means that the original function will be called only after no calls
/// have been made for the given Duration.
_Debounceable<S, T> _debounce<S, T>(_Debounceable<S?, T> function) {
  _DebounceTimer? debounceTimer;

  return (T parameter) async {
    if (debounceTimer != null && !debounceTimer!.isCompleted) {
      debounceTimer!.cancel();
    }
    debounceTimer = _DebounceTimer();
    try {
      await debounceTimer!.future;
    } catch (error) {
      if (error is _CancelException) {
        return null;
      }
      rethrow;
    }
    return function(parameter);
  };
}

// A wrapper around Timer used for debouncing.
class _DebounceTimer {
  _DebounceTimer() {
    _timer = Timer(debounceDuration, _onComplete);
  }

  late final Timer _timer;
  final Completer<void> _completer = Completer<void>();

  void _onComplete() {
    _completer.complete();
  }

  Future<void> get future => _completer.future;

  bool get isCompleted => _completer.isCompleted;

  void cancel() {
    _timer.cancel();
    _completer.completeError(const _CancelException());
  }
}

// An exception indicating that the timer was canceled.
class _CancelException implements Exception {
  const _CancelException();
}
