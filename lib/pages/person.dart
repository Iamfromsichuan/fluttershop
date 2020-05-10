import 'package:flutter/cupertino.dart';

class Person extends StatefulWidget {
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('个人中心'),
    );
  }
}
