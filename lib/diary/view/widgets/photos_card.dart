import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hl_image_picker/hl_image_picker.dart';
import 'package:site_diary_app/bloc/site_diary_bloc.dart';
import 'package:site_diary_app/diary/view/widgets/media_preview.dart';

class PhotosCard extends StatefulWidget {
  const PhotosCard({super.key});

  @override
  _PhotosCardState createState() => _PhotosCardState();
}

class _PhotosCardState extends State<PhotosCard> {
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

  _updatePhotosToBloc() {
    // Convert HLPickerItem list to a list of strings containing the file paths
    final photoPaths = _selectedImages.map((e) => e.path).toList();

    // Get the SiteDiaryBloc instance from the context
    final bloc = context.read<SiteDiaryBloc>();

    // Call the updatePhotos method on the bloc instance to update the photos
    bloc.updatePhotos(photoPaths);
  }

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
        _selectedImages = images;
      });
      _updatePhotosToBloc();
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
      _updatePhotosToBloc();
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
      _updatePhotosToBloc();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void didUpdateWidget(covariant PhotosCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Call _updatePhotosToBloc whenever the widget updates
    _updatePhotosToBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 28,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// 1. Title
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

              /// 2. Selected Images preview
              MediaPreview(
                photos: _selectedImages,
                onItemRemoved: (removedItem) {
                  setState(() {
                    _selectedImages.remove(removedItem);
                  });
                  _updatePhotosToBloc();
                },
              ),
              const SizedBox(height: 21),

              /// 'Add photo' button
              Center(
                child: ElevatedButton(
                  onPressed: _openPicker,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.lightGreenAccent.shade700,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 56,
                    height: 50,
                    child: const Center(
                      child: Text(
                        'Add a photo',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Include in photo gallery',
                    style: TextStyle(fontSize: 17),
                  ),
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
