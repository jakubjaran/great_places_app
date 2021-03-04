import 'dart:io';

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _imageFile;

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
          child: _imageFile != null
              ? Image.file(
                  _imageFile,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('No Image Taken'),
        ),
        Expanded(
          child: FlatButton.icon(
            onPressed: () {},
            textColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.camera_alt),
            label: Text('Take an Image'),
          ),
        )
      ],
    );
  }
}