import 'dart:io';

import 'package:flutter/material.dart';

class PlaceTile extends StatelessWidget {
  final File imageFile;

  PlaceTile(this.imageFile);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(imageFile),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
