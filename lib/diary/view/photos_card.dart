import 'package:flutter/material.dart';

import 'package:site_diary_app/diary/view/add_photo_button.dart';

import 'package:hl_image_picker/hl_image_picker.dart';

import 'package:site_diary_app/diary/view/media_preview.dart';

class PhotoCard extends StatefulWidget {
  const PhotoCard({super.key});

  @override
  _PhotoCardState createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> {
  // This is a mock list of image thumbnails. Replace with your data.
  List<String> thumbnails = [];
  bool _isChecked = false;
  final _picker = HLImagePicker();

  List<HLPickerItem> _selectedImages = [];

  final bool _isCroppingEnabled = false;
  final int _count = 4;
  final MediaType _type = MediaType.all;
  final bool _isExportThumbnail = true;
  final bool _enablePreview = false;
  final bool _usedCameraButton = true;
  final int _numberOfColumn = 3;
  final bool _includePrevSelected = true;
  CropAspectRatio? _aspectRatio;
  List<CropAspectRatioPreset>? _aspectRatioPresets;
  final double _compressQuality = 0.9;
  final CroppingStyle _croppingStyle = CroppingStyle.normal;

  _openPicker() async {
    try {
      final images = await _picker.openPicker(
        cropping: _isCroppingEnabled,
        selectedIds: _includePrevSelected
            ? _selectedImages.map((e) => e.id).toList()
            : null,
        pickerOptions: HLPickerOptions(
          mediaType: _type,
          enablePreview: _enablePreview,
          isExportThumbnail: _isExportThumbnail,
          thumbnailCompressFormat: CompressFormat.jpg,
          thumbnailCompressQuality: 0.9,
          recordVideoMaxSecond: 40,
          maxSelectedAssets: _isCroppingEnabled ? 1 : _count,
          usedCameraButton: _usedCameraButton,
          numberOfColumn: _numberOfColumn,
          isGif: true,
        ),
        cropOptions: HLCropOptions(
          aspectRatio: _aspectRatio,
          aspectRatioPresets: _aspectRatioPresets,
          compressQuality: _compressQuality,
          compressFormat: CompressFormat.jpg,
          croppingStyle: _croppingStyle,
        ),
      );
      setState(() {
        print('NEW COUNT = ${images.length}');
        _selectedImages = images;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _openCamera() async {
    try {
      final image = await _picker.openCamera(
        cropping: _isCroppingEnabled,
        cameraOptions: HLCameraOptions(
          cameraType:
              _type == MediaType.video ? CameraType.video : CameraType.image,
          recordVideoMaxSecond: 40,
          isExportThumbnail: _isExportThumbnail,
          thumbnailCompressFormat: CompressFormat.jpg,
          thumbnailCompressQuality: 0.9,
        ),
        cropOptions: HLCropOptions(
          aspectRatio: _aspectRatio,
          aspectRatioPresets: _aspectRatioPresets,
          croppingStyle: _croppingStyle,
        ),
      );
      setState(() {
        _selectedImages = [image];
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _openCropper() async {
    try {
      if (_selectedImages.isEmpty) {
        return;
      }
      final image = await _picker.openCropper(
        _selectedImages[0].path,
        cropOptions: HLCropOptions(
          aspectRatio: _aspectRatio,
          aspectRatioPresets: _aspectRatioPresets,
          compressQuality: _compressQuality,
          compressFormat: CompressFormat.jpg,
          croppingStyle: _croppingStyle,
        ),
      );
      setState(() {
        _selectedImages = [image];
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 28,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add photos to site diary',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              const Divider(),
              MediaPreview(
                items: _selectedImages,
                onItemRemoved: (removedItem) {
                  setState(() {
                    print("----REMOVED $removedItem");
                    _selectedImages.remove(removedItem);
                    print(_selectedImages);
                  });
                },
              ),
              const SizedBox(height: 14),
              Center(
                child: ElevatedButton(
                  onPressed: _openPicker,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.lightGreen,
                  ),
                  child: const Text('Add a photo'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Include in photo gallery'),
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
