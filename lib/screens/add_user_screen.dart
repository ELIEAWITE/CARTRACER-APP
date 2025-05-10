import '../utils/extensions.dart'; // Assurez-vous que le chemin est correct
import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AddUserScreen extends StatefulWidget {
  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final ApiService _apiService = ApiService();
  String role = 'student'; // Valeur par défaut
  String firstName = '';
  String lastName = '';
  String username = '';
  String password = '';

  void _addUser() async {
    if (firstName.isNotEmpty && lastName.isNotEmpty && username.isNotEmpty && password.isNotEmpty) {
      bool success = await _apiService.addUser(role, firstName, lastName, username, password);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Utilisateur ajouté avec succès')));
        Navigator.pop(context); // Fermer l'écran après ajout
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur lors de l\'ajout de l\'utilisateur')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Ajouter Utilisateur')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: role,
              onChanged: (String? newValue) {
                setState(() {
                  role = newValue!;
                });
              },
              items: <String>['student', 'driver']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value.capitalizeFirstOfEach()),
                );
              }).toList(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Nom'),
              onChanged: (value) => firstName = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Post nom'),
              onChanged: (value) => lastName = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Nom d\'Utilisateur'),
              onChanged: (value) => username = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Mot de Passe'),
              obscureText: true,
              onChanged: (value) => password = value,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addUser,
              child: Text('Ajouter Utilisateur'),
            ),
          ],
        ),
      ),
    );
  }
}