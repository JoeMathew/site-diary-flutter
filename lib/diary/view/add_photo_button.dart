import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoButton extends StatefulWidget {
  const AddPhotoButton({super.key});

  @override
  _AddPhotoButtonState createState() => _AddPhotoButtonState();
}

class _AddPhotoButtonState extends State<AddPhotoButton> {
  final ImagePicker _picker = ImagePicker();
  bool isLoading = false;

  Future<void> getImageFromCamera() async {
    // Your camera implementation here
  }

  Future<void> getDogBreedApiCall() async {
    // Your API call logic here
  }

  Future<void> _showModal() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Click to take picture
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text('Click to take picture'),
            onTap: () async {
              // await getImageFromCamera(context).then((value) => {
              //   getDogBreedApiCall(),
              //   // setState(() {
              //   //   isImageSelected =
              //   //       true;
              //   // }),
              // },);
              setState(() {
                isLoading = true;
              });
              await Future.delayed(
                const Duration(
                  seconds: 7,
                ),
              );
              setState(() {
                isLoading = false;
              });

              // await _picker.getImage(source: ImageSource.camera);
              // await getDogBreedApiCall();
              // setState(() {
              //   isLoading = true;
              // });
              // await Future.delayed(const Duration(seconds: 7));
              // setState(() {
              //   isLoading = false;
              // });
              // Navigator.of(context).pop();
            },
          ),

          // Browse to upload picture
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Browse to upload picture'),
            onTap: () async {
              // await _picker.getImage(source: ImageSource.gallery);
              // // Implement your additional logic here for the gallery option
              // setState(() {
              //   isLoading = true;
              // });
              // await Future.delayed(const Duration(seconds: 7));
              // setState(() {
              //   isLoading = false;
              // });
              // Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _showModal,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightGreen,
      ),
      child: const Text('Add a photo'),
    );
  }
}



                                    // /// 3.5 Button - Click to take picture
                                    
                                    // const SizedBox(height = 28),

                                    // /// 3.6 Button - Browse to upload pic
                                    // Center(
                                    //     child = Container(
                                    //         decoration: BoxDecoration(
                                    //             color: customWhite,
                                    //             borderRadius:
                                    //                 const BorderRadius.all(
                                    //                     Radius.circular(28),),
                                    //             boxShadow: [
                                    //               BoxShadow(
                                    //                   color: Colors.grey
                                    //                       .withOpacity(0.5),
                                    //                   spreadRadius: 1,
                                    //                   blurRadius: 3,
                                    //                   offset:
                                    //                       const Offset(0, 3),),
                                    //             ],),
                                    //         width: Get.size.width * 0.7,
                                    //         height: 50,
                                    //         child: TextButton(
                                    //             style: TextButton.styleFrom(
                                    //               foregroundColor:
                                    //                   Theme.of(context)
                                    //                       .secondaryHeaderColor,
                                    //               side: BorderSide(
                                    //                   color: Theme.of(context)
                                    //                       .secondaryHeaderColor, // Border color
                                    //                   width: 2,),
                                    //               shape: RoundedRectangleBorder(
                                    //                 borderRadius:
                                    //                     BorderRadius.circular(
                                    //                         28,),
                                    //               ),
                                    //             ),
                                    //             onPressed: () async {
                                    //               image =
                                    //                   await picker.pickImage(
                                    //                       source: ImageSource
                                    //                           .gallery,);
                                    //               setState(() {
                                    //                 final bytes =
                                    //                     File(image!.path)
                                    //                         .readAsBytesSync();
                                    //                 final dynamic base64Image =
                                    //                     base64Encode(bytes);
                                    //                 isDropDownValue
                                    //                     ? getBlobUrl(
                                    //                             base64Image,)
                                    //                         .then((value) => {
                                    //                               setState(() {
                                    //                                 imageUrl = value
                                    //                                     .data
                                    //                                     .toString();
                                    //                               }),
                                    //                             },)
                                    //                     : getDogBreedApiCall();

                                    //                 isImageSelected = true;
                                    //               });
                                    //               setState(() {
                                    //                 isLoading = true;
                                    //               });
                                    //               await Future.delayed(
                                    //                   const Duration(
                                    //                       seconds: 7,),);
                                    //               setState(() {
                                    //                 isLoading = false;
                                    //               });
                                    //             },
                                    //             child: isLoading
                                    //                 ? const SizedBox(
                                    //                     width: 16,
                                    //                     height: 16,
                                    //                     child:
                                    //                         CircularProgressIndicator(
                                    //                       color: Colors.white,
                                    //                       strokeWidth: 1.5,
                                    //                     ),)
                                    //                 : Row(
                                    //                     mainAxisAlignment:
                                    //                         MainAxisAlignment
                                    //                             .center,
                                    //                     children: [
                                    //                         Icon(
                                    //                           Icons
                                    //                               .file_upload_outlined,
                                    //                           color: Theme.of(
                                    //                                   context,)
                                    //                               .secondaryHeaderColor,
                                    //                         ),
                                    //                         const SizedBox(
                                    //                             width: 18,),
                                    //                         Text(
                                    //                             'Browse to upload picture',
                                    //                             style:
                                    //                                 buttonStyle(),),
                                    //                       ],),),),),