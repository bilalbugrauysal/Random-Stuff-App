import 'package:flutter/material.dart';
import 'package:random_stuff_display/screens/inspiration_quote.dart';
import 'package:random_stuff_display/screens/kanye_rest.dart';

import 'dad_jokes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Random Stuff"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.amber[600],
              child:
                  TextButton(onPressed: goToDadJokes, child: Text('Dad Jokes')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: TextButton(
                  onPressed: goToInspirationQuote,
                  child: Text('Inspiration Quote')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: TextButton(
                  onPressed: goToKanyeRest, child: Text('Kanye Rest')),
            ),
          ],
        ));
  }

  void goToDadJokes() {
    final route = MaterialPageRoute(builder: (context) => DadJokes());
    Navigator.push(context, route);
  }

  void goToInspirationQuote() {
    final route = MaterialPageRoute(builder: (context) => InspirationQuote());
    Navigator.push(context, route);
  }

  void goToKanyeRest() {
    final route = MaterialPageRoute(builder: (context) => KanyeRest());
    Navigator.push(context, route);
  }
}
