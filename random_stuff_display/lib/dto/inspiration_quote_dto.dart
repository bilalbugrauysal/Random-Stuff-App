class InsirationQuoteDto {
  String? author;
  String? quote;

  InsirationQuoteDto(this.author, this.quote);

  InsirationQuoteDto.fromJson(Map<String, dynamic> json)
      : author = json['quoteAuthor'],
        quote = json['quoteText'];

  Map<String, dynamic> toJson() => {
        'quoteAuthor': author,
        'quoteText': quote,
      };
}

// https://docs.flutter.dev/development/data-and-backend/json
