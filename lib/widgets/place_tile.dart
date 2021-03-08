import 'dart:io';

import 'package:flutter/material.dart';

import '../screens/place_details_screen.dart';

class PlaceTile extends StatelessWidget {
  final File imageFile;
  final String title;
  final String id;

  PlaceTile(this.imageFile, this.title, this.id);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(PlaceDetailsScreen.routeName, arguments: id);
      },
      child: Container(
        height: 300,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Hero(
              tag: id,
              child: Image.file(
                imageFile,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
