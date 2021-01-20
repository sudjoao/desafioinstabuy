import 'package:DesafioInstabuy/Utils/arguments.dart';
import 'package:DesafioInstabuy/style.dart';
import 'package:flutter/material.dart';

class ItemInfoScreen extends StatefulWidget {
  @override
  _ItemInfoScreenState createState() => _ItemInfoScreenState();
}

class _ItemInfoScreenState extends State<ItemInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final ItemInfoArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOrange,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Color(0xFFF8DDD8),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: args.item['name'],
              child: Image.network(
                  'https://assets.instabuy.com.br/ib.item.image.medium/m-' +
                      args.item['images'][0]),
            ),
            Text(
              args.item['name'],
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            Text(
              "R\$" + args.item['prices'][0]['price'].toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
