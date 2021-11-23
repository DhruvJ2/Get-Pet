import 'dart:ui';

import 'package:flutter/material.dart';

class PetPage extends StatefulWidget {
  String? category;
  PetPage({
    Key? key,
    this.category,
  }) : super(key: key);

  @override
  State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  String _text = '';

  void initState() {
    super.initState();
    _text = 'Adopt';
  }

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
                  Positioned(
                    top: 20.0,
                    left: 120.0,
                    right: 120.0,
                    bottom: 20.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/dog.jpg'),
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
                    top: 20.0,
                    left: 30.0,
                    right: 30.0,
                    height: 150.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.cyan.shade900,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 15.0,
                            ),
                            color: Colors.black.withOpacity(0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Name',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w200,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Breed ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        letterSpacing: 2.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text(
                                      '18 years ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        letterSpacing: 2.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 7.0,
                                ),
                                Text(
                                  'Category : Dog',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Favourite Food ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: 20.0,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      // color: Colors.black,
                      height: 200.0,
                      width: _width - 40,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                minRadius: 20.0,
                                maxRadius: 25.0,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Daniel',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '*******************************',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            height: 110.0,
                            width: _width - 40,
                            child: Text(
                              '_' * 500,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    right: 10.0,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10.0),
                          height: 45.0,
                          width: 250.0,
                          child: FlatButton(
                            splashColor: Colors.cyan.shade700,
                            autofocus: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            onPressed: () {
                              setState(() {
                                _text = 'Adopted';
                              });
                            },
                            padding: EdgeInsets.all(10.0),
                            textColor: Colors.white,
                            color: Colors.cyan.shade900,
                            child: Text(
                              _text,
                              style: TextStyle(
                                fontSize: 18.0,
                                letterSpacing: 5.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
