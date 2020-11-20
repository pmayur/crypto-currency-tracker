import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  Authentication({Key key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  /* Controllers for EMAIL and PASSWORD fields */
  bool isLoginPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // DECORATION for background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff349497),
              Color(0xff32afd7),
            ],
          ),
        ),
        
        // Login / Register form
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Email container
                Container(
                  padding: EdgeInsets.only(bottom: 1),
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        color: Colors.black38,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                // Password Container
                Container(
                  width: 300,
                  padding: EdgeInsets.only(bottom: 1),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black38,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: Colors.black38,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                // Confirm Password Container
                Container(
                  width: 300,
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black38,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: Colors.black38,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                // Login Button
                ButtonTheme(
                  height: 50,
                  minWidth: 300,
                  child: RaisedButton(
                    onPressed: () {},
                    textColor: Colors.white54,
                    color: Color(0xff0a4457),
                    child: Text("LOGIN"),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                ),

                // OR text Container
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Text('OR'),
                ),

                // Signup / Login Text Link
                Text(
                  'Register',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
