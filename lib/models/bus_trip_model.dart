import 'package:syncfusion_flutter_maps/maps.dart';

class BusTrip {
  String routeID;
  List<MapLatLng> shape;
  String headsign;

  BusTrip({required this.routeID, required this.shape, required this.headsign});
}
