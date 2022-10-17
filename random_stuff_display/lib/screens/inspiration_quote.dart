import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:random_stuff_display/services/inspiration_quote.dart';

import '../dto/inspiration_quote_dto.dart';

class InspirationQuote extends StatefulWidget {
  const InspirationQuote({super.key});

  @override
  State<InspirationQuote> createState() => _InspirationQuoteState();
}

class _InspirationQuoteState extends State<InspirationQuote> {
  InsirationQuoteDto? item = null;

  @override
  void initState() {
    super.initState();
    this.getInspirationQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inspiration Quote"),
        actions: [
          IconButton(
            onPressed: getInspirationQuote,
            icon: Icon(
              Icons.refresh,
              size: 24.0,
              semanticLabel: 'Get New Inspiration quote',
            ),
          )
        ],
      ),
      body: Visibility(
        visible: item != null,
        child: Column(
            children: item != null
                ? [
                    Text(item!.author!),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        item!.quote!,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ]
                : []),
      ),
    );
  }

  Future<void> getInspirationQuote() async {
    InspirationQuoteService.getInspirationQuote().then((value) => {
          setState(() {
            item = value;
          })
        });
  }
}
