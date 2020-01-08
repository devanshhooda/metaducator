import 'package:flutter/material.dart';
import './process.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

final TextStyle hintS = new TextStyle(fontSize: 20);
final TextStyle labelS = new TextStyle(fontSize: 30);
TextEditingController _email = new TextEditingController();
TextEditingController _pass = new TextEditingController();
TextEditingController _name = new TextEditingController();
// bool visible = true;

final Authentication _auth = new Authentication();

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  // void setState(fn) {
  //   super.setState(fn);
  //   void changeVisibility(bool visible) {
  //     if (visible)
  //       visible = false;
  //     else
  //       visible = true;
  //   }@override
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        children: <Widget>[
          Positioned(left: 30, top: 40, child: goBackButton(context)),
          Positioned(
              top: 190,
              child: new Container(
                height: 400,
                width: 424,
                child: new Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70)),
                  child: new ListView(
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          'Enter Details:',
                          style: new TextStyle(
                              color: Colors.redAccent,
                              fontSize: 45,
                              fontWeight: FontWeight.bold),
                        ),
                        padding: EdgeInsets.only(left: 40, top: 20, bottom: 15),
                      ),
                      new Container(
                        height: 70,
                        width: 10,
                        padding: EdgeInsets.only(left: 5, right: 20),
                        child: new TextField(
                          controller: _name,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.person,
                              size: 45,
                            ),
                            labelText: 'Name',
                            labelStyle: labelS,
                            hintText: 'ex: Michael Phelps',
                            hintStyle: hintS,
                          ),
                        ),
                      ),
                      new Container(
                        height: 70,
                        width: 10,
                        padding: EdgeInsets.only(left: 5, right: 20),
                        child: new TextField(
                          controller: _email,
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
                          controller: _pass,
                          obscureText: true,
                          decoration: InputDecoration(
                            suffix: IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.visibility_off,
                                size: 30,
                              ),
                            ),
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
                      ),
                    ],
                  ),
                ),
              )),
          Positioned(
            top: 70,
            left: 110,
            child: new Container(
              height: 180,
              width: 200,
              alignment: Alignment.topCenter,
              child: new Image.asset(
                'assets/images.png',
              ),
              padding: EdgeInsets.only(top: 5),
            ),
          ),
          Positioned(
            top: 620,
            left: 140,
            child: registerButton(context),
          ),
        ],
      ),
    );
  }
}

Widget registerButton(BuildContext context) {
  return new Card(
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    color: Colors.teal[300],
    child: new FlatButton(
      onPressed: () async {
        if (_email.toString().isNotEmpty && _pass.toString().isNotEmpty) {
          dynamic result =
              await _auth.signUp(_email.toString(), _pass.toString());
          if (result == null)
            print('SingUp error');
          else
            Navigator.pop(context);
        }
      },
      child: new Container(
        child: new Text(
          'Register',
          style: new TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    ),
  );
}

Widget goBackButton(BuildContext context) {
  return new Card(
    elevation: 5,
    shape: CircleBorder(side: BorderSide(style: BorderStyle.none)),
    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    color: Colors.transparent,
    child: new IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(
        Icons.keyboard_arrow_left,
        size: 30,
      ),
    ),
  );
}
