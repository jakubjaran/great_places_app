import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;

  MapScreen({
    this.initialLocation = const PlaceLocation(
      latitude: 52.237049,
      longitude: 21.017532,
    ),
    this.isSelecting = false,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _selectedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      _selectedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSelecting ? 'Select On Map' : 'Your Place'),
        actions: widget.isSelecting
            ? [
                IconButton(
                  icon: Icon(Icons.check),
                  onPressed: _selectedLocation == null
                      ? null
                      : () {
                          Navigator.of(context).pop(_selectedLocation);
                        },
                ),
              ]
            : [],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 16,
        ),
        onTap: widget.isSelecting ? _selectLocation : null,
        markers: {
          if (_selectedLocation != null || !widget.isSelecting)
            Marker(
              markerId: MarkerId('m1'),
              position: _selectedLocation ??
                  LatLng(
                    widget.initialLocation.latitude,
                    widget.initialLocation.longitude,
                  ),
            ),
        },
      ),
    );
  }
}
