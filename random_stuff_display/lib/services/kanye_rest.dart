import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/kanye_rest_dto.dart';

class KanyeRestService {
  static Future<KanyeRestDto?> getKanyeRest() async {
    final url = Uri.parse('https://api.kanye.rest/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return KanyeRestDto.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
