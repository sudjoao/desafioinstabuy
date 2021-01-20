import 'package:DesafioInstabuy/screens/Home/main.dart';
import 'package:DesafioInstabuy/screens/ItemInfo/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Insta Buy App',
      routes: {
        '/': (context) => HomeScreen(),
        '/iteminfo': (context) => ItemInfoScreen(),
      },
      initialRoute: '/',
    );
  }
}
