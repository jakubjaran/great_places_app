import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/places.dart';
import '../helpers/location_helper.dart';

import './map_screen.dart';

class PlaceDetailsScreen extends StatelessWidget {
  static const routeName = '/place-details';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final place = Provider.of<Places>(context, listen: false).findById(id);
    final deviceHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final placeMapPreview = LocationHelper.generateLocationPreviewImage(
        place.location.latitude, place.location.longitude);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: deviceHeight - statusBarHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: place.id,
                child: Image.file(
                  place.image,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(place.title),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 100),
                  alignment: Alignment.center,
                  child: Text(
                    place.location.address,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, letterSpacing: 2),
                  ),
                ),
                Container(
                  height: 300,
                  child: Image.network(
                    placeMapPreview,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(40.0),
                  alignment: Alignment.center,
                  child: TextButton.icon(
                    label: Text('View On Map'),
                    icon: Icon(Icons.map),
                    style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (ctx) =>
                            MapScreen(initialLocation: place.location),
                      ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
