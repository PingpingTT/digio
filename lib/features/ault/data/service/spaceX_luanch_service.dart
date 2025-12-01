import 'dart:convert';

import 'package:http/http.dart' as http;

class LaunchService {
  Future<List<dynamic>> fetchLaunches() async {
    final Uri url = Uri.parse("https://api.spacexdata.com/v4/launches");

    try {
      final response = await http.get(url);
      switch (response.statusCode) {
        case 200:
          return jsonDecode(response.body);
        case 400:
          throw Exception("bad request (400)");
        case 401:
          throw Exception("unauthorized (401)");
        case 403:
          throw Exception("forbidden (403)");
        case 404:
          throw Exception("not found (404)");
        case 500:
          throw Exception("internet server error (500)");
        case 502:
          throw Exception("bad gateway (502)");
        case 503:
          throw Exception("service unavailable (503)");

        default:
          throw Exception("Unexpected Error: ${response.statusCode}");
      }
    } on Exception catch (e) {
      throw Exception("network error: $e");
    }
  }
}
      // if (response.statusCode == 200) {
      //   print("success");
      //   return response.body;
      // } else if (response.statusCode == 400) {
      //   print("bad request");
      // } else if (response.statusCode == 401) {
      //   print("unauthorized");
      // } else if (response.statusCode == 403) {
      //   print("forbidden");
      // } else if (response.statusCode == 404) {
      //   print("not found");
      // } else if (response.statusCode == 500) {
      //   print("internet server error");
      // } else if (response.statusCode == 502) {
      //   print("bad gateway");
      // } else if (response.statusCode == 503) {
      //   print("service unavailable");
      // }