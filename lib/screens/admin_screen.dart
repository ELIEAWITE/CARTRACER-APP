import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/auth_service.dart';
import 'add_user_screen.dart'; // Assurez-vous d'importer le fichier d'ajout d'utilisateur

class AdminScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  void _viewUsers(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Utilisateurs'),
          content: SingleChildScrollView(
            child: ListBody(
              children: _authService.users.map((user) => Text('${user.firstName} - ${user.password}')).toList(),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('Fermer')),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _viewUsers(context),
              child: Text('Voir tous les utilisateurs'),
            ),
            SizedBox(height: 20), // Ajoute un espacement entre les boutons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddUserScreen()),
                );
              },
              child: Text('Ajouter Utilisateur'),
            ),
          ],
        ),
      ),
    );
  }
}
