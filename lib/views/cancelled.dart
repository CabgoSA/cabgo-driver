import 'package:flutter/material.dart';

class CancelScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Dash board Screen"),
        ),
        body: const Center(
          child: Text("Welcome to dashboard screen"),
        ));
  }
}