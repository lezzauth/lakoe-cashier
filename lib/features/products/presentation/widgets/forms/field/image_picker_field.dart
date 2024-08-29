import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_s.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class ImagePickerValue {
  File? file;
  String? url;

  ImagePickerValue({this.file, this.url});
}

class ImagePickerField extends StatefulWidget {
  final ImagePickerValue? value;
  final ValueChanged<ImagePickerValue>? onChanged;
  final String errorText;
  final ValueChanged<String>? onError;

  const ImagePickerField({
    super.key,
    this.value,
    this.onChanged,
    this.errorText = "",
    this.onError,
  });

  @override
  State<ImagePickerField> createState() => _ImagePickerFieldState();
}

class _ImagePickerFieldState extends State<ImagePickerField> {
  ImagePickerValue? _selectedFile;

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        setState(() {
          _selectedFile =
              ImagePickerValue(file: File(result.files.single.path!));
        });
        if (widget.onChanged != null) {
          widget.onChanged!(
              ImagePickerValue(file: File(result.files.single.path!)));
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
      return Image.file(
        _selectedFile!.file!,
        fit: BoxFit.cover,
        height: 100,
        width: 100,
      );
    }

    if (_selectedFile?.url != null) {
      return Image.network(
        _selectedFile!.url!,
        fit: BoxFit.cover,
        height: 100,
        width: 100,
      );
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
    bool isError = widget.errorText.isNotEmpty;

    return GestureDetector(
      onTap: _pickFile,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        color: !isError ? TColors.primary : TColors.error,
        dashPattern: const [4],
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Container(
            decoration: const BoxDecoration(
              color: TColors.highlightLightest,
            ),
            height: 100,
            width: 100,
            child: _buildPreview(),
          ),
        ),
      ),
    );
  }
}
