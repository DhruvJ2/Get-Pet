import 'package:flutter/material.dart';
import 'package:pet_adopter/main.dart';
import 'package:pet_adopter/services/auth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String error = '';
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();

    var _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.cyan.shade800,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(45.0),
            height: _size.height * 0.85,
            width: _size.width * 0.80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.cyan.shade800,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    controller: _email,
                    cursorWidth: 2.0,
                    cursorColor: Colors.cyan.shade800,
                    style: TextStyle(
                      letterSpacing: 2.0,
                      color: Colors.cyan.shade800,
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter a valid Email' : null,
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
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    controller: _password,
                    cursorWidth: 2.0,
                    cursorColor: Colors.cyan.shade800,
                    obscureText: true,
                    style: TextStyle(
                      letterSpacing: 2.0,
                      color: Colors.cyan.shade800,
                    ),
                    validator: (value) =>
                        value!.length == '' ? 'Wrong Password' : null,
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
                        dynamic result = await _auth.signInWithEmailAndPassword(
                          _email.text,
                          _password.text,
                        );
                        if (result == null) error = 'Invalid Credentials';
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
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
