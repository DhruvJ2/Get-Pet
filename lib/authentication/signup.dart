import 'package:flutter/material.dart';
import 'package:pet_adopter/authentication/login.dart';
import 'package:pet_adopter/cover.dart';
import 'package:pet_adopter/main.dart';
import 'package:pet_adopter/services/auth.dart';

class SignUpPage extends StatefulWidget {
  final Function? toggle;
  SignUpPage({Key? key, this.toggle}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AuthServices _auth = AuthServices();

  final _formKey = GlobalKey<FormState>();

  final _email = TextEditingController();

  final _password = TextEditingController();

  final _conpassword = TextEditingController();
  final _username = TextEditingController();

  String error = '';

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Material(
      type: MaterialType.transparency,
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
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
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(30.0)),
                  color: Colors.white,
                ),
                child: Center(
                  child: Form(
                    key: _formKey,
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
                        Container(
                          margin: EdgeInsets.all(10.0),
                          width: _size.width - 150,
                          child: TextFormField(
                            controller: _username,
                            validator: (value) =>
                                value!.isEmpty ? 'Enter valid Input' : null,
                            cursorWidth: 2.0,
                            cursorColor: Colors.cyan.shade800,
                            style: TextStyle(
                              letterSpacing: 2.0,
                              color: Colors.cyan.shade800,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle: TextStyle(
                                color: Colors.cyan.shade800,
                                letterSpacing: 3.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.cyan.shade800,
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.cyan.shade800,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          margin: EdgeInsets.all(10.0),
                          width: _size.width - 150,
                          child: TextFormField(
                            controller: _email,
                            validator: (value) =>
                                value!.isEmpty ? 'Enter valid Email' : null,
                            cursorWidth: 2.0,
                            cursorColor: Colors.cyan.shade800,
                            style: TextStyle(
                              letterSpacing: 2.0,
                              color: Colors.cyan.shade800,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.cyan.shade800,
                                letterSpacing: 3.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.cyan.shade800,
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.cyan.shade800,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          margin: EdgeInsets.all(10.0),
                          width: _size.width - 150,
                          child: TextFormField(
                            controller: _password,
                            validator: (value) => value!.length < 6
                                ? 'Enter a strong password'
                                : null,
                            cursorWidth: 2.0,
                            cursorColor: Colors.cyan.shade800,
                            obscureText: true,
                            style: TextStyle(
                              letterSpacing: 2.0,
                              color: Colors.cyan.shade800,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.cyan.shade800,
                                letterSpacing: 3.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.cyan.shade800,
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.cyan.shade800,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          margin: EdgeInsets.all(10.0),
                          width: _size.width - 150,
                          child: TextFormField(
                            controller: _conpassword,
                            validator: (value) => value == _password.value
                                ? 'Password does not match'
                                : null,
                            cursorWidth: 2.0,
                            cursorColor: Colors.cyan.shade800,
                            obscureText: true,
                            style: TextStyle(
                              letterSpacing: 2.0,
                              color: Colors.cyan.shade800,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(
                                color: Colors.cyan.shade800,
                                letterSpacing: 3.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.cyan.shade800,
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.cyan.shade800,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                        ),
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
                            if (_formKey.currentState!.validate()) {
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                _email.text,
                                _password.text,
                                _username.text,
                              );
                              if (result == null) {
                                error = 'Enter Invalid Email';
                              }
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
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
                            widget.toggle!();
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
            Positioned(
              left: 5.0,
              top: 5.0,
              child: IconButton(
                alignment: Alignment.centerLeft,
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.cyan.shade800,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => CoverPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
