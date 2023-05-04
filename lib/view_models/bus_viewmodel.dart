import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:rapido/models/bus_trip_model.dart';
import 'package:rapido/services/firebase_manager.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:rapido/models/gps_locations.dart';
import 'package:rapido/services/firebase_manager.dart';

class BusViewModel with ChangeNotifier {
  BuildContext context;
  bool isLoading = false;
  String searchQuery = "";

  MapLatLng? currentLoc;

  BusViewModel({required this.context}) {
    initialize(context);
  }

  List<BusTrip> trips = [];

  List<BusTrip> get filteredTrips {
    if (searchQuery.isEmpty) {
      return trips;
    } else {
      return trips
          .where((e) =>
              e.headsign.toLowerCase().contains(searchQuery.toLowerCase()) ||
              e.routeID.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }
  }

  void setQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }

  BusTrip? selectedBus;

  Future<void> initialize(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final locRef = FirebaseManager.firestore
        .collection('gps_location')
        .doc('J3O10jyFB8qLkhnVhsQ2');
    locRef.snapshots().listen((event) async {
      print("Called");
      final data = await FirebaseManager.firestore
          .collection('gps_location')
          .doc('J3O10jyFB8qLkhnVhsQ2')
          .get();
      currentLoc = MapLatLng(data['latitude'], data['longitude']);
      notifyListeners();
    });
    var shapesCsvString =
        await DefaultAssetBundle.of(context).loadString("assets/shapes.csv");
    final shapesCsv = CsvToListConverter().convert(shapesCsvString, eol: "\n");
    shapesCsv.removeAt(0);
    final shapeIDs = shapesCsv.map((e) => e[1]).toSet().toList();
    Map<int, List<MapLatLng>> busRoutesShapes = {};
    shapeIDs.forEach((routeID) {
      final routePoints = shapesCsv
          .where((e) => e[1] == routeID)
          .map((e) => MapLatLng(e[2], e[3]))
          .toList();
      busRoutesShapes[routeID] = routePoints;
    });

    var routesCsvString =
        await DefaultAssetBundle.of(context).loadString("assets/routes.csv");
    final routesCsv = CsvToListConverter().convert(routesCsvString, eol: "\n");
    routesCsv.removeAt(0);
    for (var trip in routesCsv) {
      final routeID = trip[0];
      final headsign = trip[3];
      final shapeID = trip[4];
      final shape = busRoutesShapes[shapeID];
      if (shape != null) {
        trips.add(BusTrip(
          routeID: "$routeID",
          headsign: headsign,
          shape: shape,
        ));
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
