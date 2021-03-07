import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../helpers/location_helper.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _mapPreviewImageUrl;

  Future<void> _getCurrentLocation() async {
    final locationData = await Location().getLocation();
    final locationPreviewImageUrl = LocationHelper.generateLocationPreviewImage(
        locationData.latitude, locationData.longitude);
    setState(() {
      _mapPreviewImageUrl = locationPreviewImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          width: double.infinity,
          height: 150,
          alignment: Alignment.center,
          child: _mapPreviewImageUrl == null
              ? Text('No Location Chosen')
              : Image.network(
                  _mapPreviewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: Icon(Icons.location_on),
              label: Text('Current location'),
              style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(width: 20),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map),
              label: Text('Select on map'),
              style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
