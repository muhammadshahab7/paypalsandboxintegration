import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:paypalsandboxintegration/pages/errorpage.dart';
import 'package:paypalsandboxintegration/pages/successpage.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isSuccess = false;
  bool isError = false;
  bool isCancel = false;
  @override
  Widget build(BuildContext context) {
    return isSuccess
        ? const SuccessPage()
        : Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(
                  "Checkout Page",
                  style: TextStyle(fontSize: 26),
                ),
              ),
              elevation: 1,
            ),
            body: Center(
              child: MaterialButton(
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => PaypalCheckout(
                      sandboxMode: true,
                      clientId:
                          "AWjIZ-76GJ52dyWP6pbhlAj_JmQ4iXoPw7EMX_2br32w6gMI0ztk3exrqQ1UeQC8jkMXbVMD4-9HLu-L",
                      secretKey:
                          "EAesUAtLQwD-GfMR5ZlK58xGObLMHFpxClXylS-SiYN7BaPLS1tRY926QtajROx-abneArIar72HfQ4yE",
                      returnURL: "com.example.paypalsandboxintegration",
                      cancelURL: "com.example.paypalsandboxintegration",
                      transactions: const [
                        {
                          "amount": {
                            "total": '70',
                            "currency": "USD",
                            "details": {
                              "subtotal": '70',
                              "shipping": '0',
                              "shipping_discount": 0
                            }
                          },
                          "description": "The payment transaction description.",
                          "item_list": {
                            "items": [
                              {
                                "name": "OTG Cable",
                                "quantity": 4,
                                "price": '5',
                                "currency": "USD"
                              },
                              {
                                "name": "USB Cable",
                                "quantity": 5,
                                "price": '10',
                                "currency": "USD"
                              }
                            ],
                          }
                        }
                      ],
                      note: "Contact us for any questions on your order.",
                      onSuccess: (Map params) async {
                        setState(() {
                          isSuccess = true;
                        });
                      },
                      onError: (error) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ErrorPage()));
                      },
                    ),
                  ));
                },
                color: Colors.blue,
                minWidth: 220,
                height: 50,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white10)),
                child: const Text(
                  'PayPal Payment',
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 26,
                  ),
                ),
              ),
            ),
          );
  }
}
