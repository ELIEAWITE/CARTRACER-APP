import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(CartracerApp());
}

class CartracerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartracer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}
// group members: KASEREKA KAWA GUY
// KASKOTE KASEREKA DAVID
// MUPENZI AWITE ELIE