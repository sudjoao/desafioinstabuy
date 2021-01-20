import 'package:DesafioInstabuy/components/BannerCard/main.dart';
import 'package:flutter/material.dart';

class BannersScreen extends StatelessWidget {
  final List<dynamic> banners;
  BannersScreen({this.banners});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(0),
        scrollDirection: Axis.vertical,
        children: banners
            .map(
              (banner) => BannerCard(
                imageUrl: banner['image'],
                title: banner['title'],
              ),
            )
            .toList(),
      ),
    );
  }
}
