import 'package:cloud_firestore/cloud_firestore.dart';

class TravelHistory {
  String? busID;
  String? departure;
  String? arrival;
  String? date;
  String? time;
  String? busfare;

  TravelHistory({
    this.busID,
    this.departure,
    this.arrival,
    this.date,
    this.time,
    this.busfare,
  });

  factory TravelHistory.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return TravelHistory(
      busID: snapshot.id,
      departure: data?['departure'],
      arrival: data?['arrival'],
      date: data?['date'],
      time: data?['time'],
      busfare: data?['busfare'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (busID != null) 'id': busID,
      if (departure != null) 'departure': departure,
      if (arrival != null) 'arrival': arrival,
      if (date != null) 'date': date,
      if (time != null) 'time': time,
      if (busfare!= null)'busfare':busfare,
    };
  }
}
