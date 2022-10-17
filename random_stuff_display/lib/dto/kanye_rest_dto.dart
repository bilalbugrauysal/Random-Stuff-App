class KanyeRestDto {
  String? author;
  String? quote;

  KanyeRestDto(this.author, this.quote);

  KanyeRestDto.fromJson(Map<String, dynamic> json)
      : author = "Kayne Rest",
        quote = json['quote'];

  Map<String, dynamic> toJson() => {
        'author': author,
        'quote': quote,
      };
}

// https://docs.flutter.dev/development/data-and-backend/json
