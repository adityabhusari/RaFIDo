import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:rapido/view_models/bus_viewmodel.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:provider/provider.dart';
import 'package:rapido/models/gps_locations.dart';


class BusTrackingScreen extends StatefulWidget {
  BusTrackingScreen({super.key});

  @override
  State<BusTrackingScreen> createState() => _BusTrackingScreenState();
}

class _BusTrackingScreenState extends State<BusTrackingScreen> {

  late MapZoomPanBehavior _mapZoomPanBehavior;
  late MapTileLayerController _controller;
  late MapShapeLayerController controller;

  @override
  void initState() {
    super.initState();
    _mapZoomPanBehavior = MapZoomPanBehavior();
    _controller = MapTileLayerController();
    controller = MapShapeLayerController();
  }

  @override
  Widget build(BuildContext context) {
    final busVM = Provider.of<BusViewModel>(context, listen: true);
    if (busVM.selectedBus == null) {
      Navigator.pushReplacementNamed(context, "/routes");
    }

    Widget sfMap() {
      return SfMaps(
        layers: [
          MapTileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            zoomPanBehavior: _mapZoomPanBehavior,
            initialFocalLatLng: MapLatLng(18.457269, 73.850937),
            initialZoomLevel: 15,
            initialMarkersCount: 1,
            controller: _controller,
            markerBuilder: (BuildContext context, int index) {
              print(
                "Marker at: ${busVM.currentLoc?.latitude ?? 0.0}, ${busVM.currentLoc?.longitude ?? 0.0}",
              );
              return MapMarker(
                latitude: busVM.currentLoc?.latitude ?? 0.0,
                longitude: busVM.currentLoc?.longitude ?? 0.0,
                iconColor: Colors.blue,
                child: Icon(Icons.location_pin),
                
              );
              
            },
          
            
            sublayers: [
              MapPolylineLayer(
                color: Colors.blue,
                width: 4.0,
                polylines: List<MapPolyline>.generate(
                  2,
                  (int index) {
                    return MapPolyline(
                        points: busVM.selectedBus!.shape
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
        title: Text(busVM.selectedBus!.headsign),
        elevation: 2,
      ),
      body: sfMap(),
    );
  }
}
