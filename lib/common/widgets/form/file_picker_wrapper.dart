import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class ImagePickerWrapperValue {
  File? file;
  String? url;

  ImagePickerWrapperValue({this.file, this.url});
}

class ImagePickerWrapper extends StatefulWidget {
  final ImagePickerWrapperValue? value;
  final ValueChanged<ImagePickerWrapperValue>? onChanged;
  final String errorText;
  final ValueChanged<String>? onError;
  final Widget child;
  final Widget Function(ImagePickerWrapperValue value) preview;

  const ImagePickerWrapper({
    super.key,
    this.value,
    this.onChanged,
    this.errorText = "",
    this.onError,
    required this.child,
    required this.preview,
  });

  @override
  State<ImagePickerWrapper> createState() => _ImagePickerWrapperState();
}

class _ImagePickerWrapperState extends State<ImagePickerWrapper> {
  ImagePickerWrapperValue? _selectedFile;

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        setState(() {
          _selectedFile =
              ImagePickerWrapperValue(file: File(result.files.single.path!));
        });
        if (widget.onChanged != null) {
          widget.onChanged!(
              ImagePickerWrapperValue(file: File(result.files.single.path!)));
        }
      }
    } catch (e) {
      if (widget.onError != null) {
        widget.onError!(e.toString());
      }
    }
  }

  Widget _buildPreview() {
    if (_selectedFile?.file != null) {
      // return Image.file(
      //   _selectedFile!.file!,
      //   fit: BoxFit.cover,
      //   height: 100,
      //   width: 100,
      // );

      return widget
          .preview(ImagePickerWrapperValue(file: _selectedFile!.file!));
    }

    if (_selectedFile?.url != null) {
      // return Image.network(
      //   _selectedFile!.url!,
      //   fit: BoxFit.cover,
      //   height: 100,
      //   width: 100,
      // );
      return widget.preview(ImagePickerWrapperValue(url: _selectedFile!.url!));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12.0),
          child: const UiIcons(
            TIcons.image,
            color: TColors.primary,
          ),
        ),
        const TextActionS(
          "Tambah Foto",
          color: TColors.primary,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedFile = widget.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isEmptyValue = widget.value?.file == null && widget.value?.url == null;

    return GestureDetector(
      onTap: _pickFile,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isEmptyValue) widget.child,
              if (!isEmptyValue) _buildPreview(),
              if (widget.errorText.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: SizedBox(
                    width: 100,
                    child: TextBodyS(
                      widget.errorText,
                      color: TColors.error,
                    ),
                  ),
                )
            ],
          ),
          if (!isEmptyValue)
            Positioned(
              top: -5,
              right: -5,
              child: GestureDetector(
                onTap: () {
                  if (widget.onChanged != null) {
                    widget.onChanged!(ImagePickerWrapperValue());
                    setState(() {
                      _selectedFile = null;
                    });
                  }
                },
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      color: TColors.neutralLightLightest,
                      border: Border.all(
                        width: 1,
                        color: TColors.error,
                      ),
                      borderRadius: BorderRadius.circular(24)),
                  child: Container(
                    height: 12,
                    width: 12,
                    alignment: Alignment.center,
                    child: const UiIcons(
                      TIcons.close,
                      height: 12,
                      width: 12,
                      color: TColors.error,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
