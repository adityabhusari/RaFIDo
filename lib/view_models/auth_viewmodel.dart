import 'package:flutter/material.dart';
import 'package:rapido/models/user_model.dart';
import 'package:rapido/screens/home_screen.dart';
import 'package:rapido/services/firebase_manager.dart';

class LoginViewModel with ChangeNotifier {
  String _email = '';
  String _password = '';

  String get username => _email;
  String get password => _password;

  bool isLoading = false;
  String? errorDescription;

  UserEntity? currentUser;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final auth = FirebaseManger.auth;
    try {
      final userCredentials = await auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      if (userCredentials.user != null) {
        String uid = userCredentials.user!.uid;
        final ref =
            FirebaseManger.firestore.collection('users').doc(uid).withConverter(
                  fromFirestore: UserEntity.fromFirestore,
                  toFirestore: (UserEntity user, _) => user.toFirestore(),
                );
        final userDocSnap = await ref.get();
        final userEntity = userDocSnap.data();

        if (userEntity == null) {
          throw Exception("User data not found");
        } else {
          print(userEntity.toFirestore());
          while (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
          currentUser = userEntity;
          print("User set");
          Navigator.pushReplacementNamed(context, '/home');
        }
      } else {
        throw Exception("User is null");
      }
    } catch (e) {
      errorDescription = e.toString();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
            title: Text("Error"),
            content: Text(errorDescription ?? "Unknown error"),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> logOut(BuildContext context) async {
    final auth = FirebaseManger.auth;

    try {
      await auth.signOut();
      while (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      errorDescription = e.toString();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
            title: Text("Error"),
            content: Text(errorDescription ?? "Unknown error"),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> register(BuildContext context, UserEntity user) async {
    final auth = FirebaseManger.auth;

    // Print user
    print(user.toFirestore());
    print(_email);

    try {
      final userCredentials = await auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      if (userCredentials.user != null) {
        String uid = userCredentials.user!.uid;
        while (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
        currentUser = user;
        Navigator.pushReplacementNamed(context, '\home');
        final userDocRef = FirebaseManger.firestore
            .collection('users')
            .withConverter(
              fromFirestore: UserEntity.fromFirestore,
              toFirestore: (UserEntity user, _) => user.toFirestore(),
            )
            .doc(uid);
        await userDocRef.set(user);
      } else {
        throw Exception("User is null");
      }
    } catch (e) {
      errorDescription = e.toString();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
            title: Text("Error"),
            content: Text(errorDescription ?? "Unknown error"),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}
