import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapido/screens/bus_list_screen.dart';
import 'package:rapido/screens/bus_tracking_screen.dart';
import 'package:rapido/screens/home_screen.dart';
import 'package:rapido/screens/login_screen.dart';
import 'package:rapido/screens/payment_screen.dart';
import 'package:rapido/screens/register_screen.dart';
import 'package:rapido/theme/color_schemes.dart';
import 'package:rapido/view_models/auth_viewmodel.dart';
import 'package:rapido/view_models/bus_viewmodel.dart';
import 'package:rapido/view_models/payments_viewmodel.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(
          create: (_) => LoginViewModel(),
        ),
        ChangeNotifierProvider<BusViewModel>(
          create: (_) => BusViewModel(context: context),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            shadowColor: Colors.transparent,
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            shadowColor: Colors.transparent,
          ),
        ),
        routes: {
          '/': (context) => const Text("Root"),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegistrationScreen(),
          '/home': (context) => const HomeScreen(),
          '/routes': (context) => const BusListScreen(),
          '/bus': (context) => BusTrackingScreen(),
          '/payment': (context) => const PaymentScreenParent(),
        },
        initialRoute: '/login',
      ),
    );
  }
}
