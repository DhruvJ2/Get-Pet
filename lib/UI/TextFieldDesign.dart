import 'package:flutter/material.dart';

class TextFieldDesign extends StatelessWidget {
  //Duplicate keys found
  String? name;
  TextFieldDesign({
    String? this.name,
  });

  TextEditingController _controller = TextEditingController();
  String get textvalue {
    return _controller.text;
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(10.0),
      width: _size.width - 150,
      child: TextFormField(
        controller: _controller,
        validator: (value) => value!.isEmpty ? 'Enter valid Input' : null,
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
