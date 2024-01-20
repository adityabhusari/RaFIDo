import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rapido/models/user_model.dart';
import 'package:rapido/services/firebase_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentsViewModel with ChangeNotifier {
  UserEntity user;
  final db = FirebaseManager.firestore;
  late DocumentReference userDocRef;

  PaymentsViewModel(this.user) {
    userDocRef = db.collection('users').doc(user.id);
    userDocRef.snapshots().listen((event) async {
      final data = await db.collection('users').doc(user.id).get();
      queryArguments["am"] = data.data()?["balance"]?.toString() ?? "0";
      notifyListeners();
    });
  }

  Map<String, String> queryArguments = {
    "pa": "aduspandu@okicici",
    "pn": "Aditya Bhusari",
    "tn": "Bus Fare",
    "am": "1000",
    "cu": "INR",
  };

  void makePayments() async {
    final uri = Uri.parse("upi://pay").replace(queryParameters: queryArguments);
    await launchUrl(uri);
  }
}
