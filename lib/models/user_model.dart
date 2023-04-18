import 'package:cloud_firestore/cloud_firestore.dart';

class UserEntity {
  String? id;
  String? name;
  String? username;
  String? email;
  String? phoneNumber;
  String? gender;

  UserEntity({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phoneNumber,
    this.gender,
  });

  factory UserEntity.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return UserEntity(
      id: snapshot.id,
      name: data?['name'],
      username: data?['username'],
      email: data?['email'],
      phoneNumber: data?['phoneNumber'],
      gender: data?["gender"],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (gender != null) 'gender': gender,
    };
  }
}
