import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class BusTrackingScreen extends StatelessWidget {
  BusTrackingScreen({super.key});

  MapController controller = MapController.publicTransportationLayer(
    initMapWithUserPosition: false,
    initPosition: GeoPoint(latitude: 18.457269, longitude: 73.850937),
    // areaLimit: BoundingBox(
    //   east: 10.4922941,
    //   north: 47.8084648,
    //   south: 45.817995,
    //   west: 5.9559113,
    // ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bus 42"),
        elevation: 2,
      ),
      body: OSMFlutter(
        controller: controller,
        initZoom: 15,
      ),
    );
  }
}
