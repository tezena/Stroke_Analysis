import 'package:final_sprs/data/models/userDataModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterRepository {
  Future<void> postData(UserData userData) async {
    final url =
        'https://neuronet.onrender.com/api/v1/auth/register'; // Replace with your API endpoint

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    try {
      final data = userData.toJson();

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode({"formData": data}),
      );
      if (response.statusCode == 200) {
        final message = response.body;
      } else {
        print("not#########");
        throw Exception('Error code: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to send data. Error code: $e');
    }
  }
}
