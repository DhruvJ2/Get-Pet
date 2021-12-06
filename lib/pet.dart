import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pet_adopter/addpet.dart';
import 'package:pet_adopter/models/listmodel.dart';

class PetPage extends StatefulWidget {
  late String image;
  late String name;
  late String breed;
  late String category;
  PetPage({
    Key? key,
    required String image,
    required String name,
    required String breed,
    required String category,
  }) : super(key: key) {
    this.image = image;
    this.name = name;
    this.breed = breed;
    this.category = category;
  }

  @override
  State<PetPage> createState() => _PetPageState();
}

PetListModel pet = PetListModel();

class _PetPageState extends State<PetPage> {
  void addRemove(bool pressed) {
    if (pressed) {
      pet.adoptedpets['name']!.remove(widget.name);
      pet.adoptedpets['breed']!.remove(widget.breed);
      pet.adoptedpets['image']!.remove(widget.image);
      pet.adoptedpets['category']!.remove(widget.category);
    } else {
      pet.adoptedpets['name']!.add(widget.name);
      pet.adoptedpets['breed']!.add(widget.breed);
      pet.adoptedpets['image']!.add(widget.image);
      pet.adoptedpets['category']!.add(widget.category);
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    bool pressed = pet.adoptedpets['name']!.contains(widget.name);
    ;
    Icon favorite_icon = pressed
        ? Icon(
            Icons.favorite,
            color: Colors.red,
          )
        : Icon(Icons.favorite_border_outlined);
    return Scaffold(
      backgroundColor: Colors.cyan.shade900,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _height * 0.35,
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
                        onPressed: () {
                          setState(() {
                            addRemove(pressed);
                          });
                        },
                        icon: favorite_icon,
                      ),
                    ),
                    Positioned(
                      top: 50.0,
                      left: 110.0,
                      right: 110.0,
                      bottom: 30.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            widget.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.62,
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
                      height: 170.0,
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
                                    widget.name,
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
                                      SizedBox(
                                        width: 200.0,
                                        child: Text(
                                          widget.breed,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            letterSpacing: 2.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '18 years ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
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
                                    widget.category,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
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
                      top: 250,
                      left: 20.0,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        height: 300.0,
                        width: _width - 40,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  height: 50.0,
                                ),
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
                                      '*' * 40,
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
                            width: _width * 0.90,
                            child: FlatButton(
                              splashColor: Colors.cyan.shade700,
                              autofocus: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              onPressed: () {
                                setState(() {
                                  addRemove(pressed);
                                });
                              },
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              textColor: Colors.white,
                              color: Colors.cyan.shade900,
                              child: Text(
                                pressed ? 'Adopted' : 'Adopt',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  letterSpacing: 5.0,
                                  fontWeight: FontWeight.w300,
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
      ),
    );
  }
}

class AdoptPet extends StatefulWidget {
  AdoptPet({Key? key}) : super(key: key);

  @override
  State<AdoptPet> createState() => _AdoptPetState();
}

class _AdoptPetState extends State<AdoptPet> {
  refresh(dynamic value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.cyan.shade900,
        title: Text(
          'Get Pet',
          style: TextStyle(
              letterSpacing: 3.0, fontSize: 30.0, fontWeight: FontWeight.w100),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => addPet()));
            },
            icon: Icon(Icons.add),
            splashColor: Colors.cyan.shade700,
            iconSize: 20.0,
            color: Colors.white,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: _size.height,
            child: ListView.builder(
                itemCount: pet.adoptedpets['name']!.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  // if (pet.displaypet['name']!.isEmpty) {
                  //   return ListTile(title: Text('No Adopted Pet'));
                  // } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) => PetPage(
                                        image: pet.adoptedpets['image']![index],
                                        name: pet.adoptedpets['name']![index],
                                        breed: pet.adoptedpets['breed']![index],
                                        category:
                                            pet.adoptedpets['category']![index],
                                      )))
                              .then(refresh);
                        },
                        title: Text(
                          pet.adoptedpets['name']![index],
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        subtitle: Text(
                          pet.adoptedpets['breed']![index],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        trailing: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                      Divider(
                        indent: 10.0,
                        endIndent: 10.0,
                        height: 5.0,
                        thickness: 1.5,
                        color: Colors.black,
                      ),
                    ],
                  );
                }
                // }
                ),
          ),
        ),
      ),
    );
  }
}
