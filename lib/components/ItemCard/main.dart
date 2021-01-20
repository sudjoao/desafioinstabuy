import 'package:DesafioInstabuy/Utils/arguments.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Map<dynamic, dynamic> item;
  ItemCard({@required this.item});
  String getProductName(String name) {
    List<String> splittedName = name.split(" ");
    return splittedName[0] +
        (splittedName.length > 1 ? " " + splittedName[1] : "");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/iteminfo',
              arguments: ItemInfoArguments(item));
        },
        child: Container(
          width: 110,
          color: Colors.white,
          child: Column(
            children: [
              Hero(
                tag: item['name'],
                child: Image.network(
                  'https://assets.instabuy.com.br/ib.item.image.medium/m-' +
                      item['images'][0],
                  width: 100,
                ),
              ),
              Text(
                getProductName(item['name']),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("R\$" + item['prices'][0]['price'].toString()),
            ],
          ),
        ),
      ),
    );
  }
}
