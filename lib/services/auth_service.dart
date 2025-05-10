import '../models/user.dart';

class AuthService {
  List<User> users = [];

  AuthService() {
    users.add(User(firstName: 'Admin', lastName: '', role: 'admin', password: 'ADMIN'));
    users.add(User(firstName: 'Student', lastName: '', role: 'student', password: 'student'));
    users.add(User(firstName: 'Driver', lastName: '', role: 'driver', password: 'driver'));
  }

  String authenticate(String username, String password) {
    for (var user in users) {
      if ((user.role == 'admin' && username == 'admin' && password == user.password) ||
          (user.role == 'student' && username == 'student' && password == user.password) ||
          (user.role == 'driver' && username == 'driver' && password == user.password)) {
        return user.role;
      }
    }
    return '';
  }
}