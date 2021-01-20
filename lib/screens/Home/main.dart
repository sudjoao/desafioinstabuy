import 'package:DesafioInstabuy/components/BannerCard/main.dart';
import 'package:DesafioInstabuy/screens/Banners/main.dart';
import 'package:DesafioInstabuy/screens/Collections/main.dart';
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
  List<Widget> selectedPage = [];
  int selectedIndex = 0;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 20.0),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  FlatButton(
                      onPressed: () => changePage(0), child: Text('Banners')),
                  FlatButton(
                      onPressed: () => changePage(1),
                      child: Text('Collections'))
                ],
              ),
            ),
            Container(
              child: selectedPage[selectedIndex],
              height: MediaQuery.of(context).size.height * 0.9,
            ),
          ],
        ),
      ),
    );
  }
}
