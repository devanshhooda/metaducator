import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

TextStyle barTitle = new TextStyle();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
            icon: Icon(Icons.home),
            onPressed: null,
          )),
          BottomNavigationBarItem(
              icon: IconButton(
            icon: Icon(Icons.message),
            onPressed: null,
          ))
        ],
      ),
    );
  }
}

Widget home() {
  return new CustomScrollView(
    slivers: <Widget>[
      new SliverAppBar(
        title: new Text(
          'Home',
          style: barTitle,
        ),
      ),
      new SliverFillRemaining(
        child: new ListView.builder(),
      )
    ],
  );
}
