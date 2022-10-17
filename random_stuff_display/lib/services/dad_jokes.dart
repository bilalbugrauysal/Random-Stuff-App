import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_stuff_display/dto/dad_joke_dto.dart';

class DadJokesService {
  static Future<DadJokeDto?> getRandomJoke() async {
    final url = Uri.parse('https://icanhazdadjoke.com');
    final response =
        await http.get(url, headers: {'Accept': 'application/json'});

    if (response.statusCode == 200) {
      return DadJokeDto.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
