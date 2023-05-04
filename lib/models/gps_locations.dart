// import 'dart:ffi';

// import 'package:cloud_firestore/cloud_firestore.dart';

// class Location {
//   String? gps_locationID;
//   Double? latitude;
//   Double? longitude;

//   Location({
//     this.gps_locationID,
//     this.latitude,
//     this.longitude,
//   });

//   factory Location.fromFirestore(
//     DocumentSnapshot<Map<String, dynamic>> snapshot,
//     SnapshotOptions? options,
//   ) {
//     final data = snapshot.data();

//     return Location(
//       gps_locationID: snapshot.id,
//       latitude: data?['latitude'],
//       longitude: data?['longitude'],
      
//     );
//   }

//   Map<String, dynamic> toFirestore() {
//     return {
//       if (gps_locationID != null) 'id':gps_locationID ,
//       if (latitude != null) 'latitude': latitude,
//       if (longitude != null) 'arrival': longitude,
      
//     };
//   }
// }
