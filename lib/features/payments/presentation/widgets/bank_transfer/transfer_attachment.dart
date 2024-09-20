import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class TransferAttachment {
  File? file;
  String? url;

  TransferAttachment({this.file, this.url});
}

class TransferAttachmentField extends StatefulWidget {
  final TransferAttachment? value;
  final ValueChanged<TransferAttachment>? onChanged;
  final String errorText;
  final ValueChanged<String>? onError;

  const TransferAttachmentField({
    super.key,
    this.value,
    this.onChanged,
    this.errorText = "",
    this.onError,
  });

  @override
  State<TransferAttachmentField> createState() =>
      _TransferAttachmentFieldState();
}

class _TransferAttachmentFieldState extends State<TransferAttachmentField> {
  TransferAttachment? _selectedFile;

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        setState(() {
          _selectedFile =
              TransferAttachment(file: File(result.files.single.path!));
        });
        if (widget.onChanged != null) {
          widget.onChanged!(
              TransferAttachment(file: File(result.files.single.path!)));
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
        height: 200,
        // width: 100,
      );
    }

    if (_selectedFile?.url != null) {
      return Image.network(
        _selectedFile!.url!,
        fit: BoxFit.cover,
        height: 200,
        // width: 100,
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
              if (isEmptyValue)
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  color: isError ? TColors.error : TColors.primary,
                  dashPattern: const [4],
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: SizedBox(
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              child: const UiIcons(
                                TIcons.camera,
                                height: 40,
                                width: 40,
                                color: TColors.primary,
                              ),
                            ),
                            const TextBodyM(
                              "Foto bukti transfer",
                              color: TColors.primary,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              if (!isEmptyValue) ...[
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: TColors.highlightLightest,
                    ),
                    height: 200,
                    width: double.infinity,
                    child: _buildPreview(),
                  ),
                ),
              ],
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
                    widget.onChanged!(TransferAttachment());
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
