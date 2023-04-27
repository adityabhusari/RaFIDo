import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  void makePayments() async {
    Map<String, String> queryArguments = {
      "pa": "bankar.aditi@okhdfcbank",
      "pn": "Aditi Bankar",
      "tn": "Bus Fare",
      "am": "5",
      "cu": "INR",
    };

    final uri = Uri.parse("upi://pay").replace(queryParameters: queryArguments);
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: Center(
        child: FilledButton(
          child: Text("Pay"),
          onPressed: makePayments,
        ),
      ),
    );
  }
}
