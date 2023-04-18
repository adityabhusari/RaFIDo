import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapido/models/user_model.dart';
import 'package:rapido/view_models/auth_viewmodel.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  UserEntity user = UserEntity();

  void _setGender(String? newGender) {
    setState(() {
      user.gender = newGender ?? "Male";
    });
  }

  Widget build(BuildContext context) {
    final loginVM = Provider.of<LoginViewModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        elevation: 2,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                onChanged: (value) {
                  user.name = value;
                },
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
                onChanged: (value) {
                  user.username = value;
                },
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                onChanged: loginVM.setPassword,
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                onChanged: (value) {
                  user.email = value;
                  loginVM.setEmail(value);
                },
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
                onChanged: (value) {
                  user.phoneNumber = value;
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Gender:"),
                  MenuAnchor(
                    menuChildren: [
                      RadioMenuButton<String>(
                        value: "Male",
                        groupValue: user.gender,
                        onChanged: _setGender,
                        child: const Text("Male"),
                      ),
                      RadioMenuButton<String>(
                        value: "Female",
                        groupValue: user.gender,
                        onChanged: _setGender,
                        child: const Text("Female"),
                      ),
                      RadioMenuButton<String>(
                        value: "Prefer not to say",
                        groupValue: user.gender,
                        onChanged: _setGender,
                        child: const Text("Prefer not to say"),
                      ),
                    ],
                    builder: (context, controller, child) {
                      return TextButton(
                        child: Text(user.gender ?? "Choose One"),
                        onPressed: () {
                          if (controller.isOpen) {
                            controller.close();
                          } else {
                            controller.open();
                          }
                        },
                      );
                    },
                  )
                ],
              ),
              const SizedBox(height: 16.0),
              FilledButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Register"),
                    SizedBox(width: 8.0),
                    Icon(Icons.arrow_forward),
                  ],
                ),
                onPressed: () {
                  loginVM.register(context, user);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
