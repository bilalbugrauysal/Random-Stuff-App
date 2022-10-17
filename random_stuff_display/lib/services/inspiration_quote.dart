import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/inspiration_quote_dto.dart';

class InspirationQuoteService {
  static Future<InsirationQuoteDto?> getInspirationQuote() async {
    final url = Uri.parse(
        'http://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return InsirationQuoteDto.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
