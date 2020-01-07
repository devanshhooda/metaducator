import 'package:flutter/material.dart';
import 'login_page.dart';

void main() => runApp(Metaducator());

class Metaducator extends StatefulWidget {
  @override
  _MetaducatorState createState() => _MetaducatorState();
}

class _MetaducatorState extends State<Metaducator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
