import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_config/flutter_config.dart';

String userName = "";
String googleMapKey = FlutterConfig.get('googleAPIKey');

void main() {
  print("Google Map Key: $googleMapKey");
  // The rest of your main function or code.
}

const CameraPosition googlePlexInitialPosition = CameraPosition(
    target: LatLng(23.7168531,90.4941576),
    zoom: 21,
  );