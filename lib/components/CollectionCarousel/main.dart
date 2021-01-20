import 'dart:ui';

import 'package:DesafioInstabuy/components/ItemCard/main.dart';
import 'package:flutter/material.dart';

class CollectionCarousel extends StatelessWidget {
  final Map<dynamic, dynamic> collection;
  CollectionCarousel({@required this.collection});

  @override
  Widget build(BuildContext context) {
    print(collection['items'][0]['prices'][0]['price']);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          collection['title'],
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          height: 175,
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            scrollDirection: Axis.horizontal,
            itemCount: collection['items'].length,
            itemBuilder: (BuildContext context, int index) {
              return ItemCard(item: collection['items'][index]);
            },
          ),
        ),
      ],
    );
  }
}
