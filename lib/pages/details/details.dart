import 'package:flutter/cupertino.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  final String url;

  DetailsPage({Key key, this.url, this.title}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Details'),
    );
  }
}
