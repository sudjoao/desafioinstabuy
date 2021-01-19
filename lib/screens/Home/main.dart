import 'dart:ui';

import 'package:DesafioInstabuy/services/InstaBuy.dart';
import 'package:flutter/material.dart';

var instaBuyService = InstaBuyService();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FlatButton(
            color: Colors.black,
            onPressed: () => instaBuyService.getLayout(),
            child: Text(
              'Press me',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
