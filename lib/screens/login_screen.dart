import 'package:flutter/material.dart';
import 'package:rapido/view_models/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final loginVM = Provider.of<LoginViewModel>(context, listen: true);

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome to",
                    style: Theme.of(context).textTheme.titleMedium),
                Text("Rapido",
                    style: Theme.of(context).textTheme.displayMedium),
                const SizedBox(height: 24.0),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                          ),
                          onChanged: loginVM.setEmail,
                        ),
                        SizedBox(height: 16.0),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                          obscureText: true,
                          onChanged: loginVM.setPassword,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () async {
                            Navigator.pushNamed(context, '/register');
                            // await loginVM.register(context);
                          },
                          child: const Text('Sign Up'),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: FilledButton(
                          onPressed: () async {
                            await loginVM.login(context);
                          },
                          child: const Text('Login'),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Forgot Password?"),
                ),
              ],
            ),
          ),
          if (loginVM.isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
