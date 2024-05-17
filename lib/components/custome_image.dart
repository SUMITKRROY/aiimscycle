import 'dart:developer';
import 'dart:io';
import 'package:aiimscycle/components/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NameWithImage extends StatefulWidget {
  final String label;
  final Function(File) onImageSelected;

  NameWithImage({Key? key, required this.label, required this.onImageSelected}) : super(key: key);

  @override
  State<NameWithImage> createState() => _NameWithImageState();
}

class _NameWithImageState extends State<NameWithImage> {
  File? _image;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.label),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                _showPicker(context);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_circle,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Attach",
                    // style: TextStyle(color: Color.fromARGB(66, 65, 57, 57)),
                  )
                ],
              ),
            ),
            const SizedBox(width: 8),
            Visibility(
              visible: _image != null,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FullScreenImage(imageUrl: _image!)));
                },
                child: const Icon(Icons.remove_red_eye_outlined),
              ),
            ),
          ],
        )
      ],
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext Index) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
              children: [
                const Text('Select any one ', textScaleFactor: 1.0, textAlign: TextAlign.start),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        _imgFromCamera().then((image) {
                          if (image != null) {
                            widget.onImageSelected(image); // Call the callback function
                            setState(() {
                              _image = image;
                            });
                          }
                        });
                        Navigator.of(context).pop();
                      },
                      child: const SizedBox(
                        width: 60,
                        child: Wrap(
                          children: [
                            SizedBox(
                              width: 50,
                              child: Icon(Icons.camera_alt_outlined),
                            ),
                            Text('Camera')
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                      child: VerticalDivider(
                        thickness: 2,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _imgFromGallery().then((image) {
                          if (image != null) {
                            widget.onImageSelected(image); // Call the callback function
                            setState(() {
                              _image = image;
                            });
                          }
                        });
                        Navigator.of(context).pop();
                      },
                      child: const SizedBox(
                        width: 50,
                        child: Wrap(
                          children: [
                            SizedBox(
                              width: 50,
                              child: Icon(Icons.photo_library),
                            ),
                            Text('Gallery')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _removeImage() {
    try {
      setState(() {
        _image?.delete();
        // Uncomment the line below if needed
        // _imageListBase64.clear();
      });
    } catch (e) {
      // Handle the exception (log or show an error message)
      log('Error deleting image: $e');
    }
  }

  Future<File?> _imgFromCamera() async {
    final image = await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  Future<File?> _imgFromGallery() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }
}
