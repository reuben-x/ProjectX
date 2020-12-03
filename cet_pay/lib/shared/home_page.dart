import 'dart:math';
import 'dart:ui';
import 'package:cet_pay/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cet_pay/shared/database.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class LandingHome extends StatefulWidget {
  @override
  _LandingHomeState createState() => _LandingHomeState();
}

class _LandingHomeState extends State<LandingHome> {
  Razorpay razorpay;

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_85KeJrsIww1tuP",
      "amount": 2000 * 100,
      "currency": "INR",
      "name": "CET Pay",
      "description": "Payment for hostel fees",
      "prefill": {
        "name": "Reuben",
        "contact": "918714829999",
        "email": "reuben@cet.ac.in"
      },
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    print("Payment success");
    Toast.show("Success", context);
  }

  void handlerErrorFailure() {
    print("Payment error");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 20, 10, 40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ListTile(
                title: Text(
                  'Hello!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                subtitle: Text(
                  'Kevin M Thazhathoot',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          Container(
            height: 165,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('Hostel Fees - November 2020',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                    height: 0,
                    indent: 110,
                    endIndent: 110,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        '\u{20B9} 2000',
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        child: const Text('NOTIFY ME LATER'),
                        onPressed: () {
                          /* ... */
                        },
                      ),
                      const SizedBox(width: 8),
                      FlatButton(
                        child: const Text(
                          'PAY NOW',
                          style: TextStyle(color: Colors.green),
                        ),
                        onPressed: () {
                          openCheckout();
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
// void _navigateToNextScreen(BuildContext context) {
//   Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
// }