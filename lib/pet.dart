import 'package:flutter/material.dart';

class PetPage extends StatelessWidget {
  String category;
  PetPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Icon favorite_icon = Icon(Icons.favorite_border_outlined);
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.cyan.shade900,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.0,
              width: _width,
              child: Stack(
                children: [
                  Positioned(
                    top: 20.0,
                    left: 100.0,
                    right: 100.0,
                    bottom: 20.0,
                    child: CircleAvatar(
                      radius: 70.0,
                      backgroundImage: AssetImage('assets/dog.jpg'),
                    ),
                  ),
                  Positioned(
                    top: 5.0,
                    left: 5.0,
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back_ios_new),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                    right: 5.0,
                    top: 5.0,
                    child: IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: favorite_icon,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              width: _width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 10.0,
                    right: 10.0,
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: 45.0,
                      width: 250.0,
                      child: RaisedButton(
                        autofocus: false,
                        focusElevation: 0.0,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.white, width: 1.0)),
                        onPressed: () {},
                        padding: EdgeInsets.all(10.0),
                        textColor: Colors.white,
                        color: Colors.cyan.shade900,
                        child: Text(
                          'Adopt',
                          style: TextStyle(
                            fontSize: 18.0,
                            letterSpacing: 5.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 50.0,
                      bottom: 70.0,
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.all(10.0),
                        height: 100.0,
                        width: _width - 20.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 1.0,
                        )),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
