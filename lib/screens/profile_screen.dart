import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapido/models/user_model.dart';
import 'package:rapido/view_models/auth_viewmodel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.user});
  final UserEntity user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final loginVM = Provider.of<LoginViewModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              loginVM.logOut(context);
            },
          ),
        ],
        elevation: 2,
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 144,
                  ),
                  Text(
                    widget.user.name ?? "No Name",
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.credit_card,
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    widget.user.username ?? "No Username",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.phone,
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    widget.user.phoneNumber ?? "No Phone Number",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.email,
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    widget.user.email ?? "No Email",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    widget.user.gender == "Male"
                        ? Icons.male
                        : (widget.user.gender == "Female"
                            ? Icons.female
                            : Icons.transgender),
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    widget.user.gender ?? "No Gender",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
