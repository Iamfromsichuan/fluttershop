import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provide/provide.dart';
import 'package:shop/pages/HomePage.dart';
import 'package:shop/pages/category_page.dart';
import 'package:shop/pages/person.dart';
import 'package:shop/pages/shopping_cart.dart';
import 'package:shop/provide/current_index_provide.dart';
import '../config/index.dart';

class IndexPage extends StatelessWidget {
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

  final List<Widget> tabBodies = [
    HomePage(),
    CategoryPage(),
    ShoppingCart(),
    Person(),
  ];

   // tabBodies[currentIndex]

  @override
  Widget build(BuildContext context) {
    return Provide<CurrentIndexProvide>(
      builder: (context, child, val) {
        int currentIndex =
            Provide.value<CurrentIndexProvide>(context).currentIndex;
        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: bottomTabs,
            currentIndex: currentIndex,
            onTap: (index) {
              Provide.value<CurrentIndexProvide>(context).changeIndex(index);
            },
          ),
          body: IndexedStack(
            index: currentIndex,
            children: tabBodies,
          ),
        );
      },
    );
  }
}
