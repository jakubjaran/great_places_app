import 'dart:io';

import 'package:flutter/material.dart';

class PlaceTile extends StatelessWidget {
  final File imageFile;
  final String title;
  final String address;

  PlaceTile(this.imageFile, this.title, this.address);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 100),
      height: 300,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(imageFile),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 5,
              color: Colors.black45,
            ),
          ),
          SizedBox(height: 10),
          Text(
            address,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black45),
          ),
        ],
      ),
    );
  }
}
