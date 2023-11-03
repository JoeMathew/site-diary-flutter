import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hl_image_picker/hl_image_picker.dart';

class MediaPreview extends StatefulWidget {
  const MediaPreview({
    required this.photos,
    required this.onItemRemoved, // Add this callback
    super.key,
  });

  final List<HLPickerItem> photos;
  final Function(HLPickerItem) onItemRemoved;

  @override
  _MediaPreviewState createState() => _MediaPreviewState();
}

class _MediaPreviewState extends State<MediaPreview> {
  late List<HLPickerItem> _photos;

  @override
  void initState() {
    super.initState();
    _photos = List.from(widget.photos);
  }

  @override
  void didUpdateWidget(MediaPreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if items list has been updated
    if (widget.photos != oldWidget.photos) {
      _photos = List.from(widget.photos);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_photos.isEmpty) {
      return Container(
        height: 100,
        color: Colors.blueGrey.shade100,
        child: const Center(
          child: Text('No photos added'),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Wrap(
        spacing: 8,
        runSpacing: 4,
        children: _photos.map((item) {
          File? imageFile = File(item.path);
          if (item.type == 'video') {
            imageFile = item.thumbnail != null ? File(item.thumbnail!) : null;
          }
          return Stack(
            children: [
              if (imageFile != null)
                InkWell(
                  onTap: item.type == 'video' ? () {} : null,
                  child: Image.file(imageFile, width: 100),
                )
              else
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  child: const Text('No thumbnail'),
                ),
              Positioned(
                top: 2, // slight padding from the top
                right: 2, // slight padding from the right
                child: Container(
                  width: 20, // set specific width
                  height: 20, // set specific height
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 1.5,
                    ), // white border
                  ),
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.zero, // remove default padding
                      constraints:
                          const BoxConstraints(), // remove default constraints
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 12,
                      ), // adjust icon size
                      onPressed: () {
                        setState(() {
                          _photos.remove(item);
                        });
                        widget.onItemRemoved(item); // Notify the parent
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
