import 'dart:ui';

import 'package:DesafioInstabuy/screens/Banners/main.dart';
import 'package:DesafioInstabuy/screens/Collections/main.dart';
import 'package:DesafioInstabuy/services/InstaBuy.dart';
import 'package:DesafioInstabuy/style.dart';
import 'package:flutter/material.dart';

var instaBuyService = InstaBuyService();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> banners = [];
  List<dynamic> collections = [];
  List<Widget> selectedPage = [];
  int selectedIndex = 0;

  void getLayoutData() async {
    var layoutData = await instaBuyService.getLayout();
    setState(() {
      banners = layoutData['data']['banners']
          .where((banner) => banner['is_mobile'] == true)
          .toList();
      collections = layoutData['data']['collection_items'];
      selectedPage.add(BannersScreen(banners: banners));
      selectedPage.add(CollectionsScreen(collections: collections));
    });
  }

  void changePage(int pageNumber) {
    setState(() {
      selectedIndex = pageNumber;
    });
  }

  FontWeight getButtonWeight(bool isSelected) {
    return isSelected ? FontWeight.bold : FontWeight.normal;
  }

  @override
  void initState() {
    getLayoutData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOrange,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
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
          children: [
            Container(
              child: Row(
                children: [
                  FlatButton(
                    onPressed: () => changePage(0),
                    child: Text(
                      'Banners',
                      style: TextStyle(
                        fontWeight: getButtonWeight(selectedIndex == 0),
                        color: kOrange,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () => changePage(1),
                    child: Text(
                      'Produtos',
                      style: TextStyle(
                        fontWeight: getButtonWeight(selectedIndex == 1),
                        color: kOrange,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: selectedPage[selectedIndex],
              height: MediaQuery.of(context).size.height * 0.8,
            ),
          ],
        ),
      ),
    );
  }
}
