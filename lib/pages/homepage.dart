import 'package:flutter/material.dart';
import 'package:paypalsandboxintegration/pages/checkoutpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "Home Page",
            style: TextStyle(fontSize: 26),
          ),
        ),
        elevation: 1,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const CheckoutPage()));
          },
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white10)),
          color: Colors.black,
          height: 50,
          minWidth: 250,
          child: const Text(
            "Go To Checkout Page",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
