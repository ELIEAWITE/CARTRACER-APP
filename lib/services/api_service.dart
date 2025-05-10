import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = 'https://unitrack.uzashop.org/api/login';

  Future<bool> addUser(String role, String firstName, String lastName, String username, String password) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'role': role,
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'password': password,
      }),
    );

    return response.statusCode == 201;
  }
}
