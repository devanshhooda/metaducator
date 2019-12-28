import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

final TextStyle hintS = new TextStyle(fontSize: 20);
final TextStyle labelS = new TextStyle(fontSize: 30);

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Column(
        children: <Widget>[
          new Container(
            height: 180,
            width: 200,
            alignment: Alignment.topCenter,
            child: new Image.asset(
              'assets/images.png',
            ),
            padding: EdgeInsets.only(top: 5),
          ),
          new Container(
            height: 350,
            width: 500,
            child: new Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70)),
                child: new ListView(
                  children: <Widget>[
                    new Container(
                      child: new Text(
                        'Login',
                        style: new TextStyle(
                            color: Colors.blue,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.only(left: 40, top: 20, bottom: 15),
                    ),
                    new Container(
                      height: 70,
                      width: 10,
                      padding: EdgeInsets.only(left: 5, right: 20),
                      child: new TextField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.account_circle,
                            size: 45,
                          ),
                          labelText: 'Email/Username',
                          labelStyle: labelS,
                          hintText: 'example123@gmail.com',
                          hintStyle: hintS,
                        ),
                      ),
                    ),
                    new Container(
                      height: 70,
                      width: 10,
                      padding: EdgeInsets.only(left: 5, right: 20),
                      child: new TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            size: 40,
                          ),
                          labelText: 'Password',
                          labelStyle: labelS,
                          hintText: '********',
                          hintStyle: hintS,
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
