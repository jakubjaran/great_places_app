import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/places.dart';

import './add_place_screen.dart';

import '../widgets/place_tile.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<Places>(context, listen: false).fetchAndSetItems(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<Places>(
                    child: Center(
                      child: Text('No places added yet!'),
                    ),
                    builder: (ctx, places, ch) => places.items.length <= 0
                        ? ch
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: ListView.builder(
                              itemCount: places.items.length,
                              itemBuilder: (ctx, index) {
                                final place = places.items[index];
                                return PlaceTile(
                                  place.image,
                                  place.title,
                                  place.id,
                                );
                              },
                            ),
                          ),
                  ),
      ),
    );
  }
}
