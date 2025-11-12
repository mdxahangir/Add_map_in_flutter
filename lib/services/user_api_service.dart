import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<User?> fetchUser(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$id'));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return User.fromJson(json);
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }

  Future<bool> login(String email, String password) async {
    if (email.contains('@') && password.length > 3) {
      return true;
    }
    return false;
  }

  Future<bool> updateUser(User user) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/${user.id}'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(user.toJson()),
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Error updating user: $e');
      return false;
    }
  }
}