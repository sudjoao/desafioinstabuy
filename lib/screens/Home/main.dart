import 'package:DesafioInstabuy/components/BannerCard/main.dart';
import 'package:DesafioInstabuy/services/InstaBuy.dart';
import 'package:flutter/material.dart';

var instaBuyService = InstaBuyService();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> banners = [];
  List<dynamic> collections = [];
  @override
  void initState() {
    getLayoutData();
    super.initState();
  }

  void getLayoutData() async {
    var layoutData = await instaBuyService.getLayout();
    setState(() {
      banners = layoutData['data']['banners']
          .where((banner) => banner['is_mobile'] == true)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
        child: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: banners
                .map(
                  (dynamic banner) => BannerCard(
                    imageUrl: banner['image'],
                    title: banner['title'],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
