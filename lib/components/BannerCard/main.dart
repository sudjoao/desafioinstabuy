import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  BannerCard({@required this.imageUrl, @required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(title),
          Image.network(
              'https://assets.instabuy.com.br/ib.store.banner/bnr-' + imageUrl),
        ],
      ),
    );
  }
}
