import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import '../providers/locations_provider.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<LocationsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubicaciones'),
      ),
      body: Stack(
        children: <Widget>[
          FlutterMap(
            mapController: provider.mapController,
            options: MapOptions(
              center: LatLng(3.483678, -76.522836),
              zoom: 10.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayerOptions(
                markers: [
                  for (var location in provider.locations)
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(location.latitud, location.longitud),
                      builder: (ctx) => const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40.0,
                      ),
                    ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: provider.isAnimating
                    ? null
                    : () {
                        provider.getLocations();
                        provider.startAnimation();
                      },
                child: const Text('Iniciar'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
