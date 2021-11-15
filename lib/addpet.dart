import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pet_adopter/UI/TextFieldDesign.dart';

class addPet extends StatelessWidget {
  const addPet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: _size.height,
            width: _size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.cyan.shade900, Colors.white],
                stops: [0.5, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),
            ),
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
              margin: EdgeInsets.only(top: 50.0, right: 50.0),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(20.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(-2, -2),
                    blurRadius: 12.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              height: _size.height - 200,
              width: _size.width - 100,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(20.0),
                    height: 110.0,
                    width: 110.0,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Colors.black26,
                          child: Text(
                            'Add photo',
                            style: TextStyle(color: Colors.black45),
                          ),
                        ),
                        Positioned(
                          bottom: 5.0,
                          right: 5.0,
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                ),
                              ],
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: IconButton(
                              iconSize: 22.0,
                              onPressed: () {
                                //file handling
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AddPicture()));
                              },
                              color: Colors.black,
                              icon: Icon(Icons.add),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  TextFieldDesign(name: 'Name'),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFieldDesign(name: 'Breed'),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFieldDesign(name: 'Category'),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFieldDesign(name: 'Favourite Food'),
                  SizedBox(
                    height: 20.0,
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
                      'ADD',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 3.0,
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

///INCOMPLETE
class AddPicture extends StatelessWidget {
  const AddPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade800,
    );
  }
}
