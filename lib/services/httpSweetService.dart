import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpSweetService {
  String baseUrl = "https://foodapp-74686.firebaseio.com";

  get getSweetList async {
    final response = await http.get("$baseUrl/tatli.json");

    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = json.decode(response.body);
        print(jsonBody);

        break;
      default:
    }
  }
}
