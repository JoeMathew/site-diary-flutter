import 'package:flutter/material.dart';

import 'package:site_diary_app/diary/view/add_photo_button.dart';

class PhotoCard extends StatefulWidget {
  const PhotoCard({super.key});

  @override
  _PhotoCardState createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> {
  // This is a mock list of image thumbnails. Replace with your data.
  List<String> thumbnails = [];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 28,
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add photos to site diary',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Divider(),
              // Wrap(
              //   spacing: 8,
              //   runSpacing: 8,
              //   children: thumbnails.map((thumbnail) {
              //     return Stack(
              //       alignment: Alignment.topRight,
              //       children: [
              //         Image.asset(
              //           thumbnail,
              //           width: 50, // Set your desired width for the thumbnail
              //           height: 50, // Set your desired height for the thumbnail
              //           fit: BoxFit.cover,
              //         ),
              //         IconButton(
              //           icon: const Icon(
              //             Icons.close,
              //             size: 18,
              //             color: Colors.red,
              //           ),
              //           onPressed: () {
              //             setState(() {
              //               thumbnails.remove(thumbnail);
              //             });
              //           },
              //         ),
              //       ],
              //     );
              //   }).toList(),
              // ),
              SizedBox(height: 14),
              Center(child: AddPhotoButton()),
              
            ],
          ),
        ),
      ),
    );
  }
}
