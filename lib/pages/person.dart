import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Person extends StatefulWidget {
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[SliverAppBar(
            title: Text('老孟'),
          )];
        },
        body: ListView.builder(itemBuilder: (BuildContext context,int index){
          return Container(
            height: 80,
            color: Colors.primaries[index % Colors.primaries.length],
            alignment: Alignment.center,
            child: Text(
              '$index',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        },itemCount: 20,),
      )
    );
  }
}
