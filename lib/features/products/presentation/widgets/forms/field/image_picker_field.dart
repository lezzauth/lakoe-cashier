import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lakoe_pos/common/widgets/access_permission/photo_permission.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:logman/logman.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

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

  const ImagePickerField({
    super.key,
    this.labelPicker = "Tambah Foto",
    this.value,
    this.onChanged,
    this.errorText = "",
    this.onError,
    this.sizes = 100,
  });

  @override
  State<ImagePickerField> createState() => _ImagePickerFieldState();
}

class _ImagePickerFieldState extends State<ImagePickerField> {
  ImagePickerValue? _selectedFile;

  Future<File> _saveToAppDirectory(File file) async {
    final directory = await getApplicationDocumentsDirectory();
    final newPath = '${directory.path}/${file.path.split('/').last}';
    return file.copy(newPath);
  }

  Future<bool> _showPhotoPermissionBottomSheet() async {
    bool? permissionGranted = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const CustomBottomsheet(
          child: PhotosPermission(),
        );
      },
    );

    return permissionGranted ?? false;
  }

  Future<bool> _checkPermissions() async {
    if (Platform.isAndroid) {
      return await Permission.photos.isGranted ||
          await Permission.storage.isGranted;
    }
    return await Permission.photos.isGranted; // For iOS
  }

  Future<void> _pickFile() async {
    // Check if you have permission
    bool hasPermission = await _checkPermissions();

    // If you don't have permission, show a BottomSheet to ask for permission.
    if (!hasPermission) {
      hasPermission = await _showPhotoPermissionBottomSheet();
    }

    // If permission has been granted, continue to select the image
    if (hasPermission) {
      try {
        final ImagePicker picker = ImagePicker();
        XFile? result = await picker.pickImage(source: ImageSource.gallery);

        if (result != null) {
          File savedFile = await _saveToAppDirectory(File(result.path));

          setState(() {
            _selectedFile = ImagePickerValue(file: savedFile);
          });

          if (widget.onChanged != null) {
            widget.onChanged!(ImagePickerValue(file: savedFile));
          }
        }
      } catch (e) {
        if (widget.onError != null) {
          widget.onError!(e.toString());
        }
      }
    } else {
      Logman.instance.error('Permission not granted');
    }
  }

  Widget _buildPreview() {
    if (_selectedFile?.file != null) {
      return Image.file(
        _selectedFile!.file!,
        fit: BoxFit.cover,
        height: widget.sizes,
        width: widget.sizes,
      );
    }

    if (_selectedFile?.url != null) {
      return Image.network(
        _selectedFile!.url!,
        fit: BoxFit.cover,
        height: widget.sizes,
        width: widget.sizes,
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
                  color: !isError ? TColors.primary : TColors.error,
                  dashPattern: const [4],
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: SizedBox(
                      height: widget.sizes,
                      width: widget.sizes,
                      child: _buildPreview(),
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
                    height: widget.sizes,
                    width: widget.sizes,
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
          if (!isEmptyValue)
            Positioned(
              top: -5,
              right: -5,
              child: GestureDetector(
                onTap: () {
                  if (widget.onChanged != null) {
                    widget.onChanged!(ImagePickerValue());
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
                      size: 12,
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
