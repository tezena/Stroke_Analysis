import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileRespository {
  final storage = FlutterSecureStorage();

  Future<Map<String, dynamic>> fetchUserData() async {
    final userId = await storage.read(key: "userId");
    final String apiUrl = "https://neuronet.onrender.com/api/v1/users/$userId";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        Map<String, dynamic> userData = json.decode(response.body);
        return userData;
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> updateProfile(data) async {
    print("333");
    final userId = await storage.read(key: "userId");
    final updatedData = updateSourceData(data, userId);
    try {
      final response = await http.patch(
        Uri.parse("https://neuronet.onrender.com/api/v1/users/updateUser"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(updatedData),
      );

      if (response.statusCode == 200) {
        print("Profile updated successfully");
      } else {
        print("Failed to update profile. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Map<String, dynamic> updateSourceData(
      Map<String, dynamic> sourceData, userId) {
    Map<String, dynamic> updatedData = Map.from(sourceData);

    if (updatedData.containsKey("age")) {
      String ageString = updatedData["age"];
      updatedData["age"] = int.tryParse(ageString) ?? 0;
    }
    updatedData["userId"] = "$userId";

    return updatedData;
  }
}
