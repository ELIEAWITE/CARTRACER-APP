import 'package:flutter/material.dart';
import 'admin_screen.dart';
import 'driver_screen.dart';
import 'student_screen.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  String username = '';
  String password = '';

  void _login() {
    String role = _authService.authenticate(username, password);
    if (role == 'admin') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminScreen()));
    } else if (role == 'driver') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DriverScreen()));
    } else if (role == 'student') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StudentScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('wrong user name or pass word')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LOGIN PAGE')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'User name'),
              onChanged: (value) => username = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'password'),
              obscureText: true,
              onChanged: (value) => password = value,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('login'),
            ),
          ],
        ),
      ),
    );
  }
}