import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../models/locations_model.dart';

class LocationsProvider with ChangeNotifier {
  List<Location> _locations = [];
  List<Location> get locations => _locations;

  void getList(List<Location> listC) {
    _locations = listC;
    notifyListeners();
  }

  Future getLocations() async {
    String data = await rootBundle.loadString('lib/assets/locations.json');
    var jsonResult = json.decode(data);
    var response = jsonResult['locations'];
    getList(List<Location>.from(response.map((x) => Location.fromJson(x))));
    notifyListeners();
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  bool _isAnimating = false;
  bool get isAnimating => _isAnimating;

  final MapController _mapController = MapController();
  MapController get mapController => _mapController;

  void startAnimation() {
    _currentIndex = 0;
    animateMap();
    notifyListeners();
  }

  void animateMap() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (currentIndex < locations.length) {
        mapController.move(
            LatLng(locations[currentIndex].latitud,
                locations[currentIndex].longitud),
            10.0);
        _currentIndex++;
        _isAnimating = true;
        notifyListeners();
      } else {
        timer.cancel();
        _isAnimating = false;
        notifyListeners();
      }
    });
  }
}
