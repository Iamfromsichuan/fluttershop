import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../config/index.dart';

class IndexPage extends StatelessWidget{

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text(KString.homeTitle),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      title: Text(KString.category),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      title: Text(KString.shopping_cart),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text(KString.person),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}