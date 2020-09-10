import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/sweetModel.dart';

class HttpSweetService {
  String baseUrl = "https://foodapp-74686.firebaseio.com";
  Future<List<SweetModel>> get getSweetList async {
    final response = await http.get("$baseUrl/tatli.json");

    switch (response.statusCode) {
      case HttpStatus.ok:
        List jsonBody = json.decode(response.body);
        return jsonBody.map((e) => SweetModel.fromJson(e)).toList();

        break;
      default:
    }
  }
}
