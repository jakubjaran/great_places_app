import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/places.dart';

import './screens/places_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Places(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.indigo,
          accentColor: Colors.indigoAccent,
        ),
        home: PlacesListScreen(),
      ),
    );
  }
}
