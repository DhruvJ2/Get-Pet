import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_adopter/models/listmodel.dart';

class addPet extends StatefulWidget {
  addPet({Key? key}) : super(key: key);

  @override
  State<addPet> createState() => _addPetState();
}

class _addPetState extends State<addPet> {
  TextFieldDesign textfld = TextFieldDesign();
  XFile? imageFile;

  _openGallery(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Make a Choice'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text('Gallery'),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    child: Text('Camera'),
                    onTap: () {
                      _openCamera(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  var petImage;

  ImageProvider _decideImageView() {
    if (imageFile == null) {
      return Image.asset(
        'assets/d3.png',
        fit: BoxFit.fill,
      ).image;
    } else {
      petImage = Image.file(
        File(imageFile!.path),
        fit: BoxFit.fill,
      );
      return Image.file(
        File(imageFile!.path),
        fit: BoxFit.fill,
      ).image;
    }
  }

  // final _name = TextEditingController();
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
              margin: EdgeInsets.only(top: 50.0, right: 50.0),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(20.0)),
                color: Colors.white,
              ),
              height: _size.height - 200,
              width: _size.width - 100,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 5.0,
                    left: 5.0,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.cyan.shade900,
                      ),
                    ),
                  ),
                  Column(
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
                              backgroundColor: Colors.grey[350],
                              backgroundImage: _decideImageView(),
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
                                    _showDialog(context);
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
                        onPressed: () {
                          setState(() {
                            textfld.addNewPet(petImage);
                          });
                        },
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldDesign extends StatelessWidget {
  String? name;
  TextFieldDesign({
    String? this.name,
  });

  TextEditingController _controller = TextEditingController();
  PetListModel pet = PetListModel();
  List temp = [];

  addNewPet(var image) {
    int count = 0;
    switch (name) {
      case 'Name':
        temp.add(_controller.text);
        count++;
        break;
      case 'Breed':
        temp.add(_controller.text);
        count++;
        break;
      case 'Category':
        temp.add(_controller.text.toLowerCase());
        count++;
        break;
      case 'Favourite Food':
        temp.add(_controller.text);
        count++;
        break;
    }
    if (count == 4) assignValue(image);
  }

  assignValue(var image) {
    switch (temp[2]) {
      case 'dog':
        pet.dog['name']!.add(temp[0]);
        pet.dog['breed']!.add(temp[1]);
        pet.dog['Category']!.add(temp[2]);
        pet.dog['image']!.add(image);
        break;
      case 'cat':
        pet.cat['name']!.add(temp[0]);
        pet.cat['breed']!.add(temp[1]);
        pet.cat['Category']!.add(temp[2]);
        pet.cat['image']!.add(image);
        break;
      case 'bird':
        pet.bird['name']!.add(temp[0]);
        pet.bird['breed']!.add(temp[1]);
        pet.bird['Category']!.add(temp[2]);
        pet.bird['image']!.add(image);
        break;
      case 'hamster':
        pet.hamster['name']!.add(temp[0]);
        pet.hamster['breed']!.add(temp[1]);
        pet.hamster['Category']!.add(temp[2]);
        pet.hamster['image']!.add(image);
        break;
      default:
        break;
    }
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
