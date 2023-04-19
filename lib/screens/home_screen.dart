import 'package:flutter/material.dart';
import 'package:rapido/models/user_model.dart';
import 'package:rapido/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.user});
  final UserEntity user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserEntity user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        elevation: 2,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 72,
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.user.name ?? "No Name",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.user.email ?? "No Email",
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
            ),
            ListTile(
              title: Text("Profile"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfileScreen(user: widget.user);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(widget.user.name ?? "No Name"),
      ),
    );
  }
}
