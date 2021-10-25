import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController _username = TextEditingController();
    TextEditingController _password = TextEditingController();

    var _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.cyan.shade800,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(50.0),
            height: _size.height * 0.80,
            width: _size.width * 0.75,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
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
                  cursorWidth: 2.0,
                  cursorColor: Colors.cyan.shade800,
                  maxLength: 20,
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
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
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
    );
  }
}
