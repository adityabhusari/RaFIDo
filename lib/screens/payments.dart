// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rapido/screens/login_screen.dart';
// import 'package:rapido/screens/register_screen.dart';
// import 'package:rapido/theme/color_schemes.dart';
// import 'package:rapido/view_models/auth_viewmodel.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:flutter_stripe/src/stripe.dart';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;

// class MyPay extends StatefulWidget {
//   const MyPay({super.key});

//   @override
//   State<MyPay> createState() => _MyPayState();
// }

// class _MyPayState extends State<MyPay> {
//   @override
//   Widget build(BuildContext context) {
//     createPaymentIntent(String Amount, String Currency)async {
//       try {
//         Map<String, dynamic> body = {
//           'amount': Amount,
//           'currency': Currency,
//           'payment_method_types[]': 'card'
//         };
//         var response = await http.post(
//           Uri.parse('https://api.stripe.com/v1/payment_intents'),
//           body:body,
//           headers: {
//             'Authorization': 'Bearer sk_test_51MzbjVSFk62lLqaAltIzT89vylHFVXYlF9m9Nz2U88O8NQc8hKHuxqVtzCuOUuJ6r0oC3Jv5EoVN9W3yYEyjtet200IS499eQ2',
//             'Content-Type': 'application/x-www-form-urlencoded'
//           });
//           displayPaymentSheet();
//           return jsonDecode(response.body.toString());
//       } catch (e) {
//         print('exception' + e.toString());
//       }
//     }
//     displayPaymentSheet() async {
//     try {
//       await Stripe.instance
//           .presentPaymentSheet( PresentPaymentSheetParameters(
//                clientSecret: paymentIntentData!['client_secret'],
//               confirmPayment: true,
//                )
//               )
//           .then((newValue) {
//         print('payment intent' + paymentIntentData!['id'].toString());
//         print(
//             'payment intent' + paymentIntentData!['client_secret'].toString());
//         print('payment intent' + paymentIntentData!['amount'].toString());
//         print('payment intent' + paymentIntentData.toString());
//         //orderPlaceApi(paymentIntentData!['id'].toString());
//         ScaffoldMessenger.of(context)
//             .showSnackBar(const SnackBar(content: Text("paid successfully")));

//         paymentIntentData = null;
//       }).onError((error, stackTrace) {
//         print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
//       });
//     } on StripeException catch (e) {
//       print('Exception/DISPLAYPAYMENTSHEET==> $e');
//       showDialog(
//           context: context,
//           builder: (_) => const AlertDialog(
//                 content: Text("Cancelled "),
//               ));
//     } catch (e) {
//       print('$e');
//     }
//   }
     

//     Future<void> makePayment() async {
//       try {
//         var PaymentIntentData = createPaymentIntent('60', 'USD');
//         await(Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
//           setupIntentClientSecret:'Your Secret Key' ,
//           paymentIntentClientSecret:PaymentIntentData!['client_secret'];
//         )))
//       } catch (e) {
//         print('exception' + e.toString());
//       }
//     }

//     calculateAmount(String Amount) {
//       final price = int.parse(Amount) * 100;
//       return price;
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stripe Payments'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           InkWell(
//             onTap: () async {
//               await makePayment();
//             },
//           )
//         ],
//       ),
//     );
//   }
// }