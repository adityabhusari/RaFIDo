import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:rapido/models/bus_trip_model.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class BusViewModel with ChangeNotifier {
  BuildContext context;

  BusViewModel({required this.context}) {
    initialize(context);
  }

  List<BusTrip> trips = [];

  Future<void> initialize(BuildContext context) async {
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
    notifyListeners();
    print(trips);
  }
}
