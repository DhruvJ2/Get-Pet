import 'package:flutter/material.dart';
import 'package:pet_adopter/UI/TextFieldDesign.dart';
import 'package:pet_adopter/login.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Material(
      type: MaterialType.transparency,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.cyan.shade800,
          height: _size.height * 1.25,
          width: _size.width,
          child: Container(
            margin: EdgeInsets.only(
              right: 70.0,
            ),
            width: _size.width - 70.0,
            height: _size.height * 1.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(30.0)),
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                        color: Colors.cyan.shade800,
                        letterSpacing: 4.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFieldDesign(name: 'Username'),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFieldDesign(name: 'Email'),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFieldDesign(name: 'Password'),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFieldDesign(name: 'Confirm Password'),
                  SizedBox(
                    height: 50.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.cyan.shade800,
                        shadowColor: Colors.white,
                        elevation: 0.0,
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 40.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    onPressed: () {},
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      'Already have an acoount?',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
