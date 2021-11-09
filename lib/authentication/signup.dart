import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pet_adopter/UI/TextFieldDesign.dart';
import 'package:pet_adopter/authentication/login.dart';
import 'package:pet_adopter/services/auth.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  AuthServices _auth = AuthServices();

  final _formKey = GlobalKey<FormState>();

  String email = TextFieldDesign(
    name: 'Email',
  ).textvalue;
  String password = TextFieldDesign(
    name: 'Password',
  ).textvalue;
  String confirmpassword = TextFieldDesign(
    name: 'ConfirmPassword',
  ).textvalue;
  String error = '';

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
                    onPressed: () async {
                      if (_formKey.currentState!.validate() &&
                          password == confirmpassword) {
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          error = 'Enter valid Email';
                        }
                      }
                    },
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
