import 'dart:convert';

import 'package:http/http.dart' as http;

import 'http_error_handler.dart';

class MainService {
  final http.Client httpClient;

  MainService({
    required this.httpClient,
  });

  Future login(String mail, String pass) async {
    final Uri uri = Uri.parse("https://laundry01.azurewebsites.net/api/v1/laundryuserlogin");

    try {
      final http.Response response = await httpClient.post(uri,
          headers: {"Content-Type": "application/json"},
          body: json.encode(<String, dynamic>{"Username": mail, "Password": pass}));
      if (response.statusCode != 200) {
        throw httpErrorHandler(response);
      }
      final responsebody = json.decode(response.body);
      print("body is $responsebody");

      return responsebody;
    } catch (e) {
      rethrow;
    }
  }
}
