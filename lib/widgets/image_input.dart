import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  final Function onPickImage;

  ImageInput(this.onPickImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    final imageFile = File(pickedImage.path);

    setState(() {
      _storedImage = imageFile;
    });

    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(pickedImage.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    widget.onPickImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('No Image Taken'),
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePicture,
            style: TextButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            icon: Icon(Icons.camera_alt),
            label: Text('Take an Image'),
          ),
        )
      ],
    );
  }
}
