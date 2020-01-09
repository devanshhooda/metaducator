import 'package:flutter/material.dart';
import './process.dart';
import './registerScreen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

final TextStyle hintS = new TextStyle(fontSize: 20);
final TextStyle labelS = new TextStyle(fontSize: 30);
TextEditingController _email = new TextEditingController();
TextEditingController _pass = new TextEditingController();
// bool visible = true;

final Authentication _auth = new Authentication();

class _LoginPageState extends State<LoginPage> {
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
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: new Text(
          'Metaducator',
          style: new TextStyle(
              color: Colors.redAccent,
              fontSize: 50,
              fontWeight: FontWeight.w900),
        ),
      ),
      backgroundColor: Colors.white,
      body: new Stack(
        children: <Widget>[
          // Positioned(
          //   left: 20,
          //   top: 30,
          //   child: new Text(
          //     'Metaducator',
          //     style: new TextStyle(
          //         color: Colors.redAccent,
          //         fontSize: 50,
          //         fontWeight: FontWeight.w900),
          //   ),
          // ),
          Positioned(
              top: 150,
              child: new Container(
                height: 380,
                width: 424,
                child: new Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70)),
                  child: new ListView(
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          '',
                          style: new TextStyle(
                              color: Colors.blue,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                        padding: EdgeInsets.only(left: 40, top: 30, bottom: 15),
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
                      new Container(
                        padding: EdgeInsets.only(left: 150, top: 10),
                        child: new MaterialButton(
                          child: new Text(
                            'Forgot Password ?',
                            style:
                                new TextStyle(color: Colors.blue, fontSize: 20),
                          ),
                          onPressed: null,
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Positioned(
            top: 30,
            left: 120,
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
            top: 190,
            left: 50,
            child: new Container(
              child: new Text(
                'Login',
                style: new TextStyle(
                    color: Colors.blue,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              // padding: EdgeInsets.only(left: 40, top: 30, bottom: 15),
            ),
          ),
          Positioned(
            top: 490,
            left: 160,
            child: loginButton(),
          ),
          Positioned(
            top: 615,
            left: 190,
            child: new Text(
              'OR',
              style: new TextStyle(
                  color: Colors.blue[900],
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 680,
            left: 70,
            child: newAccountButton(context),
          )
        ],
      ),
    );
  }
}

Widget loginButton() {
  return new Container(
    child: new MaterialButton(
      // onPressed: null,
      onPressed: () async {
        if (_email.toString().isNotEmpty && _pass.toString().isNotEmpty) {
          dynamic result =
              await _auth.login(_email.toString(), _pass.toString());
          if (result == null)
            print('SingIn error');
          else
            print('Object');
        }
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.teal[300],
          // borderRadius: BorderRadius.circular(20)
        ),
        child: Icon(
          Icons.arrow_forward,
          size: 75,
          color: Colors.white,
        ),
      ),
      color: Colors.white,
    ),
  );
}

Widget newAccountButton(BuildContext context) {
  return new Card(
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    color: Colors.redAccent,
    child: new FlatButton(
      // onPressed: null,
      onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => CreateAccountPage())),
      child: new Container(
        child: new Text(
          'Create a new Account',
          style: new TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    ),
  );
}
