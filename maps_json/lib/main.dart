import 'package:flutter/material.dart';
import 'package:maps_json/providers/locations_provider.dart';
import 'package:maps_json/screens/maps_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(ChangeNotifierProvider(
    create: (_) => LocationsProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MapScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
