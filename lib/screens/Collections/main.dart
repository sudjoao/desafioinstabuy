import 'package:DesafioInstabuy/components/CollectionCarousel/main.dart';
import 'package:DesafioInstabuy/services/InstaBuy.dart';
import 'package:flutter/material.dart';

var instaBuyService = InstaBuyService();

class CollectionsScreen extends StatelessWidget {
  final List<dynamic> collections;
  CollectionsScreen({@required this.collections});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: 8),
          scrollDirection: Axis.vertical,
          itemCount: collections.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: CollectionCarousel(collection: collections[index]),
            );
          }),
    );
  }
}
