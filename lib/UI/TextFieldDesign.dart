import 'package:flutter/material.dart';

class TextFieldDesign extends StatelessWidget {
  TextFieldDesign({Key? key, required String this.name}) : super(key: key);

  String name;
  late String value;

  String get textvalue {
    return value;
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(10.0),
      width: _size.width - 150,
      child: TextFormField(
        validator: (value) => value!.isEmpty ? 'Enter valid Input' : null,
        onChanged: (value) {
          this.value = value;
        },
        cursorWidth: 2.0,
        cursorColor: Colors.cyan.shade800,
        obscureText: true,
        style: TextStyle(
          letterSpacing: 2.0,
          color: Colors.cyan.shade800,
        ),
        decoration: InputDecoration(
          labelText: name,
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
    );
  }
}
