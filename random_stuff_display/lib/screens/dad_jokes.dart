import 'package:flutter/material.dart';
import 'package:random_stuff_display/dto/dad_joke_dto.dart';
import 'package:random_stuff_display/services/dad_jokes.dart';

class DadJokes extends StatefulWidget {
  const DadJokes({super.key});

  @override
  State<DadJokes> createState() => _DadJokesState();
}

class _DadJokesState extends State<DadJokes> {
  DadJokeDto? joke = null;

  @override
  void initState() {
    super.initState();
    this.getJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dad Jokes"),
        actions: [
          IconButton(
            onPressed: getJoke,
            icon: Icon(
              Icons.refresh,
              size: 24.0,
              semanticLabel: 'Get New Joke',
            ),
          )
        ],
      ),
      body: Visibility(
        visible: joke != null,
        child: Column(
            children: joke != null
                ? [
                    Text(joke!.id!),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        joke!.joke!,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Image(
                      image: NetworkImage(
                          'https://icanhazdadjoke.com/j/${joke!.id!}.png'),
                    )
                  ]
                : []),
      ),
    );
  }

  Future<void> getJoke() async {
    DadJokesService.getRandomJoke().then((value) => {
          setState(() {
            joke = value;
          })
        });
  }
}
