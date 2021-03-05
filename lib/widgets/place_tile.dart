import 'dart:io';

import 'package:flutter/material.dart';

class PlaceTile extends StatelessWidget {
  final File imageFile;
  final String title;

  PlaceTile(this.imageFile, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 100),
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(imageFile),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          letterSpacing: 5,
          color: Colors.black45,
        ),
      ),
    );
  }
}
