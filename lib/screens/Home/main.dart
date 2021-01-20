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
  Future<bool> isLoadingComplete;
  int selectedIndex = 0;

  Future<bool> getLayoutData() async {
    var layoutData = await instaBuyService.getLayout();
    setState(() {
      banners = layoutData['data']['banners']
          .where((banner) => banner['is_mobile'] == true)
          .toList();
      collections = layoutData['data']['collection_items'];
      selectedPage.add(BannersScreen(banners: banners));
      selectedPage.add(CollectionsScreen(collections: collections));
    });
    return true;
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
    isLoadingComplete = getLayoutData();
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
            FutureBuilder(
              future: isLoadingComplete,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    child: selectedPage[selectedIndex],
                    height: MediaQuery.of(context).size.height * 0.8,
                  );
                } else if (snapshot.hasError) {
                  return Text(
                      'Não foi possível conectar ao servidor, tente novamente mais tarde');
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
