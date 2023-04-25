import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:rapido/view_models/bus_viewmodel.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:provider/provider.dart';

class BusTrackingScreen extends StatefulWidget {
  BusTrackingScreen({super.key});

  @override
  State<BusTrackingScreen> createState() => _BusTrackingScreenState();
}

class _BusTrackingScreenState extends State<BusTrackingScreen> {
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

  late MapZoomPanBehavior _mapZoomPanBehavior;

  @override
  void initState() {
    super.initState();
    _mapZoomPanBehavior = MapZoomPanBehavior();
  }

  @override
  Widget build(BuildContext context) {
    final busVM = Provider.of<BusViewModel>(context, listen: true);
    final route = [];

    Widget sfMap() {
      return SfMaps(
        layers: [
          MapTileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            zoomPanBehavior: _mapZoomPanBehavior,
            initialFocalLatLng: MapLatLng(18.457269, 73.850937),
            initialZoomLevel: 15,
            sublayers: [
              MapPolylineLayer(
                color: Colors.blue,
                width: 4.0,
                polylines: List<MapPolyline>.generate(
                  2,
                  (int index) {
                    return MapPolyline(
                        points: route
                            .map((e) => MapLatLng(e.latitude, e.longitude))
                            .toList());
                  },
                ).toSet(),
              ),
            ],
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Bus 42"),
        elevation: 2,
      ),
      body: sfMap(),
    );
  }
}
