import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';

typedef EmitFunction<T> = void Function(T);

void handleDioException<T>(
  DioException e, {
  required EmitFunction<T> emit,
  required T connectionIssueState,
  required T timeoutState,
  required T unexpectedState,
}) {
  if (e.type == DioExceptionType.connectionError) {
    final socketException = e.error as SocketException?;
    if (socketException != null && socketException.osError?.errorCode == 7) {
      emit(connectionIssueState);
    } else {
      emit(connectionIssueState);
    }
    return;
  } else if (e is TimeoutException) {
    emit(timeoutState);
    return;
  } else {
    emit(unexpectedState);
    return;
  }
}
