import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:living_city/core/Exceptions.dart';
import 'package:living_city/data/repositories/location_repository.dart';

import '../models/location_model.dart';

class LocationProvider {
  final Geolocator _geolocator = Geolocator();

  Future<double> getDistance(LatLng first, LatLng second) async {
    final double distance = await Geolocator.distanceBetween(
        first.latitude, first.longitude, second.latitude, second.longitude);
    return distance;
  }

  Future<LocationModel> getPlacemarkFromAdress(String address) async {
    try {
      Location location = (await locationFromAddress(address)).first;
      List<Placemark> placemarks =
          await placemarkFromCoordinates(location.latitude, location.longitude);
      // for (Placemark place in placemarks) {
      //   print(
      //       'Place: (${place.subThoroughfare}, ${place.subLocality}, ${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.subAdministrativeArea}, ${place.thoroughfare}, ${place.position.latitude}, ${place.position.longitude} )');
      // }
      final String? name = placemarks[0].thoroughfare!.isNotEmpty
          ? placemarks[0].thoroughfare
          : placemarks[0].name!.isNotEmpty
              ? placemarks[0].name
              : placemarks[0].postalCode;

      return LocationModel(
        LatLng(
            //placemarks[0].position.latitude, placemarks[0].position.longitude),
            location.latitude,
            location.longitude),
        name: name,
        locality: placemarks[0].locality,
      );
    } catch (_) {
      throw NoConnectionException();
    }
  }

  Future<LocationModel> getPlacemarkFromCoordinates(LatLng coords) async {
    final placemarks =
        await placemarkFromCoordinates(coords.latitude, coords.longitude);
    // for (Placemark place in placemarks) {
    //   print(
    //       'Place: (${place.subThoroughfare}, ${place.subLocality}, ${place.postalCode},${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.subAdministrativeArea}, ${place.thoroughfare}, ${place.position.latitude}, ${place.position.longitude} )');
    // }
    final String? name = placemarks[0].thoroughfare!.isNotEmpty
        ? placemarks[0].thoroughfare
        : placemarks[0].name!.isNotEmpty
            ? placemarks[0].name
            : placemarks[0].postalCode;
    return LocationModel(coords, name: name, locality: placemarks[0].locality);
  }

  Stream<Position> getPositionStream() {
    //const LocationOptions locationOptions =  LocationOptions(accuracy: LocationAccuracy.best, distanceFilter: 5);
    return Geolocator.getPositionStream(
        desiredAccuracy: LocationAccuracy.best, distanceFilter: 5);
  }

  Future<LatLng> getCurrentPosition() async {
    Position p = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    return LatLng(p.latitude, p.longitude);
  }

  Future<LocationStatus> getLocationStatus() async {
    final status = await Geolocator.checkPermission();
    final permission = status == LocationPermission.always ||
        status == LocationPermission.denied;
    final enabled = await Geolocator.isLocationServiceEnabled();
    return LocationStatus(enabled, permission);
  }

  // Future<> requestLocationPermission() async {
  //   await _geolocator.permis
  // }

}
