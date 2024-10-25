import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/custom_toast.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:remove_bg/remove_bg.dart';
// import 'package:remove_bg/remove_bg.dart';

class ImagePickerValue {
  File? file;
  String? url;

  ImagePickerValue({this.file, this.url});
}

class ImagePickerField extends StatefulWidget {
  final String labelPicker;
  final ImagePickerValue? value;
  final ValueChanged<ImagePickerValue>? onChanged;
  final String errorText;
  final ValueChanged<String>? onError;
  final double sizes;
  final Color bgColor;

  const ImagePickerField({
    super.key,
    this.labelPicker = "Upload Logo",
    this.value,
    this.onChanged,
    this.errorText = "",
    this.onError,
    this.sizes = 120,
    this.bgColor = const Color(0x10000000),
  });

  @override
  State<ImagePickerField> createState() => _ImagePickerFieldState();
}

class _ImagePickerFieldState extends State<ImagePickerField> {
  ImagePickerValue? _selectedFile;
  double linearProgress = 0.0;
  bool _isLoading = false;
  Uint8List? bytes;

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        final privateKey = dotenv.env['REMOVE_BG_API_KEY'];

        setState(() {
          _isLoading = true;
        });

        Remove().bg(
          File(result.files.single.path!),
          privateKey: privateKey!,
          onUploadProgressCallback: (progressValue) {
            setState(() {
              linearProgress = progressValue;
            });
          },
        ).then((Uint8List? data) async {
          if (data != null) {
            File fileWithBgRemoved =
                await saveBytesAsFile(data, "logo_brand.png");

            setState(() {
              bytes = data;
              _isLoading = false;
              _selectedFile =
                  ImagePickerValue(file: File(fileWithBgRemoved.path));
            });

            if (widget.onChanged != null) {
              widget.onChanged!(
                  ImagePickerValue(file: File(fileWithBgRemoved.path)));
            }
          } else {
            CustomToast.show(
              context,
              "Kuota Remove.bg sudah habis.",
            );

            setState(() {
              _isLoading = false;
              _selectedFile =
                  ImagePickerValue(file: File(result.files.single.path!));
            });

            if (widget.onChanged != null) {
              widget.onChanged!(
                  ImagePickerValue(file: File(result.files.single.path!)));
            }
          }
        }).catchError((e) {
          setState(() {
            _isLoading = false;
          });

          if (widget.onError != null) {
            widget.onError!(e.toString());
          }
        });
      }
    } catch (e) {
      if (widget.onError != null) {
        widget.onError!(e.toString());
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<File> saveBytesAsFile(Uint8List bytes, String fileName) async {
    final directory = await getTemporaryDirectory();
    final filePickerDirectory = Directory('${directory.path}/file_picker');

    if (!await filePickerDirectory.exists()) {
      await filePickerDirectory.create(recursive: true);
    }

    final path = '${filePickerDirectory.path}/$fileName';
    final file = File(path);

    await file.writeAsBytes(bytes);

    return file;
  }

  Widget _buildPreview() {
    if (_selectedFile?.file != null) {
      if (bytes != null && !_isLoading) {
        return ColorFiltered(
          colorFilter: ColorFilter.mode(
            // Colors.white,
            Colors.transparent,
            BlendMode.srcATop,
          ),
          child: Image.memory(
            bytes!,
            fit: BoxFit.cover,
            height: widget.sizes,
            width: widget.sizes,
          ),
        );
      } else {
        return ColorFiltered(
          colorFilter: ColorFilter.mode(
            // Colors.white,
            Colors.transparent,
            BlendMode.srcATop,
          ),
          child: Image.file(
            _selectedFile!.file!,
            fit: BoxFit.cover,
            height: widget.sizes,
            width: widget.sizes,
          ),
        );
      }
    }

    if (_isLoading) {
      return Padding(
        padding: const EdgeInsets.all(32.0),
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2,
        ),
      );
    }

    if (_selectedFile?.url != null) {
      return ColorFiltered(
        colorFilter: ColorFilter.mode(
          // Colors.white,
          Colors.transparent,
          BlendMode.srcATop,
        ),
        child: Image.network(
          _selectedFile!.url!,
          fit: BoxFit.cover,
          height: widget.sizes,
          width: widget.sizes,
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12.0),
          child: const UiIcons(
            TIcons.imageAdd,
            color: TColors.primary,
          ),
        ),
        TextBodyS(
          widget.labelPicker,
          color: TColors.primary,
        ),
      ],
    );
  }

  // Future<void> _pickFile() async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.image,
  //       allowMultiple: false,
  //     );

  //     if (result != null && result.files.single.path != null) {
  //       setState(() {
  //         _selectedFile =
  //             ImagePickerValue(file: File(result.files.single.path!));
  //       });
  //       if (widget.onChanged != null) {
  //         widget.onChanged!(
  //             ImagePickerValue(file: File(result.files.single.path!)));
  //       }
  //     }
  //   } catch (e) {
  //     if (widget.onError != null) {
  //       widget.onError!(e.toString());
  //     }
  //   }
  // }

  // Widget _buildPreview() {
  //   if (_selectedFile?.file != null) {
  //     return ColorFiltered(
  //       colorFilter: ColorFilter.mode(
  //         // Colors.white,
  //         Colors.transparent,
  //         BlendMode.srcATop,
  //       ),
  //       child: Image.file(
  //         _selectedFile!.file!,
  //         fit: BoxFit.cover,
  //         height: widget.sizes,
  //         width: widget.sizes,
  //       ),
  //     );
  //   }

  //   if (_selectedFile?.url != null) {
  //     return ColorFiltered(
  //       colorFilter: ColorFilter.mode(
  //         // Colors.white,
  //         Colors.transparent,
  //         BlendMode.srcATop,
  //       ),
  //       child: Image.network(
  //         _selectedFile!.url!,
  //         fit: BoxFit.cover,
  //         height: widget.sizes,
  //         width: widget.sizes,
  //       ),
  //     );
  //   }

  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Container(
  //         margin: const EdgeInsets.only(bottom: 12.0),
  //         child: const UiIcons(
  //           TIcons.imageAdd,
  //           color: TColors.primary,
  //         ),
  //       ),
  //       TextBodyS(
  //         widget.labelPicker,
  //         color: TColors.primary,
  //       ),
  //     ],
  //   );
  // }

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isEmptyValue)
            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              color: !isError ? TColors.primary : TColors.error,
              dashPattern: const [4],
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Container(
                  height: widget.sizes,
                  width: widget.sizes,
                  padding: EdgeInsets.all(12),
                  child: _buildPreview(),
                ),
              ),
            ),
          if (!isEmptyValue) ...[
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Container(
                decoration: BoxDecoration(
                  color: widget.bgColor,
                ),
                height: widget.sizes,
                width: widget.sizes,
                padding: EdgeInsets.all(12),
                child: _buildPreview(),
              ),
            ),
          ],
          if (widget.errorText.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: SizedBox(
                width: widget.sizes,
                child: TextBodyS(
                  widget.errorText,
                  color: TColors.error,
                ),
              ),
            )
        ],
      ),
    );
  }
}
