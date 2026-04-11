import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sessionbloom_desktop/app.dart';
// import 'package:flutter/material.dart';

class ApiService {
  static String get baseUrl => SessionBloom.apiUrl;

  static Future<Map<String, dynamic>> testConnection() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/test')
      ).timeout(const Duration(seconds: 10));

      debugPrint('Connection test: ${response.statusCode}');
      final responseData = {"code": response.statusCode, "body": response.body};
      return responseData;

    } catch (e){
      debugPrint("Connection failed: $e");
      final responseData = {"code": 500, "body": "Unreachable server"};
      return responseData;
    }
  }
}
