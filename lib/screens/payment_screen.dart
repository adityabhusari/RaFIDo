import 'package:flutter/material.dart';
import 'package:rapido/view_models/auth_viewmodel.dart';
import 'package:rapido/view_models/payments_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class PaymentScreenParent extends StatelessWidget {
  const PaymentScreenParent({super.key});

  @override
  Widget build(BuildContext context) {
    final loginVM = Provider.of<LoginViewModel>(context, listen: true);
    if (loginVM.currentUser == null) {
      Navigator.pushReplacementNamed(context, "/login");
    }
    return ChangeNotifierProvider<PaymentsViewModel>(
      create: (_) => PaymentsViewModel(loginVM.currentUser!),
      child: const PaymentsScreen(),
    );
  }
}

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentsVM = Provider.of<PaymentsViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        elevation: 2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (paymentsVM.queryArguments["am"] == 0)
              Text("No payment due",
                  style: Theme.of(context).textTheme.titleMedium),
            if (paymentsVM.queryArguments["am"] != 0)
              Text("Amount due: ₹${paymentsVM.queryArguments["am"]}",
                  style: Theme.of(context).textTheme.titleMedium),
            FilledButton(
              child: Text("Pay"),
              onPressed: paymentsVM.makePayments,
            ),
          ],
        ),
      ),
    );
  }
}
