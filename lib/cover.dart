import 'package:flutter/material.dart';
import 'package:pet_adopter/authentication/login.dart';
import 'package:pet_adopter/authentication/signup.dart';

class CoverPage extends StatelessWidget {
  CoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.cyan.shade800,
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Get Pet',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 40.0,
                      letterSpacing: 5.0,
                      wordSpacing: 5.0,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                height: 100.0,
                width: _size.width,
              ),
              Container(
                height: _size.height - 300.0,
                width: _size.width,
                child: Image.asset(
                  'assets/Cover.png',
                  scale: 10.0,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    )),
                height: 200.0,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            letterSpacing: 4.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Colors.cyan.shade800,
                          onSurface: Colors.grey,
                          side: BorderSide(color: Colors.black12, width: 1),
                          elevation: 7,
                          minimumSize: Size(200, 50),
                          shadowColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              letterSpacing: 4.0, fontWeight: FontWeight.w800),
                        ),
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Colors.cyan.shade800,
                          onSurface: Colors.grey,
                          // side: BorderSide(color: Colors.black12, width: 1),
                          elevation: 7,
                          minimumSize: Size(200, 50),
                          shadowColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
