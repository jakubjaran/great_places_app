import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../helpers/location_helper.dart';
import '../screens/map_screen.dart';

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

  Future<void> _selectOnMap() async {
    final selectedLocation =
        await Navigator.of(context).push<LatLng>(MaterialPageRoute(
      builder: (ctx) => MapScreen(
        isSelecting: true,
      ),
      fullscreenDialog: true,
    ));

    if (selectedLocation == null) {
      return;
    }

    print(selectedLocation.longitude);
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
              onPressed: _selectOnMap,
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
