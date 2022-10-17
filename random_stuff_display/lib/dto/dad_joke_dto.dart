class DadJokeDto {
  String? id;
  String? joke;

  DadJokeDto(this.id, this.joke);

  DadJokeDto.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        joke = json['joke'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'joke': joke,
      };
}

// https://docs.flutter.dev/development/data-and-backend/json
