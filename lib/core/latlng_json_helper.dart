import 'package:latlong2/latlong.dart';

Map<String, dynamic> latLngToMap(LatLng coords) {
  return {
    'latitude': coords.latitude,
    'longitude': coords.longitude,
  };
}
