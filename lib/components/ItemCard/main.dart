import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Map<dynamic, dynamic> item;
  ItemCard({@required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      child: Column(
        children: [
          Image.network(
            'https://assets.instabuy.com.br/ib.item.image.medium/m-' +
                item['images'][0],
            width: 100,
          ),
          Text(
            item['name'].substring(0, 8),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(item['prices'][0]['price'].toString()),
        ],
      ),
    );
  }
}
