import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginRepository {
  Future<void> login(String email, String password) async {
    final apiUrl = Uri.parse('https://neuronet.onrender.com/api/v1/auth/login');
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final response = await http
        .post(
          apiUrl,
          headers: headers,
          body: json.encode({
            'email': email,
            'password': password,
          }),
        )
        .timeout(const Duration(seconds: 5));
    final storage = FlutterSecureStorage();

    if (response.statusCode == 201) {
      final responseData = json.decode(response.body);

      print('Login successful');
      print(responseData);

      final setCookieHeader = response.headers['set-cookie'];
      final userId = responseData['user']["userId"];
      final sessionCookie = setCookieHeader!.split('; ')[0];

      await storage.write(key: 'sessionCookies', value: sessionCookie);
      await storage.write(key: 'userId', value: userId);

      final sessionCookies = await storage.read(key: 'sessionCookies');
    } else {
      throw Exception('Login failed');
    }
  }

  void loggedOut() {
    final storage = FlutterSecureStorage();
    storage.deleteAll();
  }
}
