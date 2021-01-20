import 'package:DesafioInstabuy/components/CollectionCarousel/main.dart';
import 'package:DesafioInstabuy/services/InstaBuy.dart';
import 'package:flutter/material.dart';

var instaBuyService = InstaBuyService();

class CollectionsScreen extends StatefulWidget {
  @override
  _CollectionsScreenState createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  var collections = [];
  @override
  void initState() {
    getLayoutData();
    super.initState();
  }

  void getLayoutData() async {
    var layoutData = await instaBuyService.getLayout();
    setState(() {
      collections = layoutData['data']['collection_items'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
        child: Container(
          child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
              itemCount: collections.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: CollectionCarousel(collection: collections[index]),
                );
              }),
        ),
      ),
    );
  }
}
