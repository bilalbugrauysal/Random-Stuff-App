import 'package:flutter/material.dart';
import 'package:random_stuff_display/dto/kanye_rest_dto.dart';

import '../services/kanye_rest.dart';

class KanyeRest extends StatefulWidget {
  const KanyeRest({super.key});

  @override
  State<KanyeRest> createState() => _KanyeRestState();
}

class _KanyeRestState extends State<KanyeRest> {
  KanyeRestDto? item = null;

  @override
  void initState() {
    super.initState();
    this.getKanyeRest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kanye Rest"),
        actions: [
          IconButton(
            onPressed: getKanyeRest,
            icon: Icon(
              Icons.refresh,
              size: 24.0,
              semanticLabel: 'Get New Kanye Rest',
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

  Future<void> getKanyeRest() async {
    KanyeRestService.getKanyeRest().then((value) => {
          setState(() {
            item = value;
          })
        });
  }
}
