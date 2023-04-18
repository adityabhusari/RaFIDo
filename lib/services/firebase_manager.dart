import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirebaseManger {

  static final auth = FirebaseAuth.instance;
  static final firestore = FirebaseFirestore.instance;

}
