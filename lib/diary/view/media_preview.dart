import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hl_image_picker/hl_image_picker.dart';

class MediaPreview extends StatefulWidget {
  const MediaPreview({
    required this.items,
    required this.onItemRemoved, // Add this callback
    super.key,
  });

  final List<HLPickerItem> items;
  final Function(HLPickerItem) onItemRemoved;

  @override
  _MediaPreviewState createState() => _MediaPreviewState();
}

class _MediaPreviewState extends State<MediaPreview> {
  late List<HLPickerItem> _items;

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.items);
  }

  @override
  void didUpdateWidget(MediaPreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if items list has been updated
    if (widget.items != oldWidget.items) {
      _items = List.from(widget.items);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_items.isEmpty) {
      return Container(
        height: 240,
        color: Colors.grey[300],
        child: const Center(
          child: Text('Empty'),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Wrap(
        spacing: 8,
        runSpacing: 4,
        children: _items.map((item) {
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
                right: 0,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      _items.remove(item);
                    });
                    widget.onItemRemoved(
                      item,
                    ); // Notify the parent
                  },
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  void _removeItem(int index) {
    final removedItem = _items[index];
    setState(() {
      _items.removeAt(index);
    });
    widget.onItemRemoved(removedItem); // Notify the parent of the removal
  }
}
