import 'dart:convert';

import 'package:http/http.dart' as http;

import '../API.dart';

class LocationHelper {
  static String generateLocationPreviewImage(
      double latitude, double longitude) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$API_KEY';
  }

  static Future<String> getLocationAddress(double lat, double lng) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$API_KEY';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
