import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pet_adopter/PetList.dart';
import 'package:pet_adopter/UI/category.dart';
import 'package:pet_adopter/models/listmodel.dart';
import 'package:pet_adopter/pet.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody({Key? key}) : super(key: key);
  PetListModel pet = new PetListModel();
  void checkInput(String text, BuildContext context) {
    switch (text.toLowerCase()) {
      case 'dog':
      case 'dogs':
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PetList(category: 'Dog')));
        break;
      case 'cat':
      case 'cats':
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PetList(category: 'Cat')));
        break;
      case 'bird':
      case 'birds':
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PetList(category: 'Bird')));
        break;
      case 'hamster':
      case 'hamsers':
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PetList(category: 'Hamster')));
        break;
      default:
        break;
    }
    for (int i = 0; i < pet.dog['name']!.length; i++) {
      if (text == pet.dog['name']![i]) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PetPage(
                  breed: pet.dog['breed']![i],
                  image: pet.dog['image']![i],
                  category: pet.dog['category']![0],
                  name: pet.dog['name']![i],
                )));
        break;
      }
    }
    for (int i = 0; i < pet.cat['name']!.length; i++) {
      if (text == pet.cat['name']![i]) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PetPage(
                  breed: pet.cat['breed']![i],
                  image: pet.cat['image']![i],
                  category: pet.cat['category']![0],
                  name: pet.cat['name']![i],
                )));
        break;
      }
    }
    for (int i = 0; i < pet.bird['name']!.length; i++) {
      if (text == pet.bird['name']![i]) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PetPage(
                  breed: pet.bird['breed']![i],
                  image: pet.bird['image']![i],
                  category: pet.bird['category']![0],
                  name: pet.bird['name']![i],
                )));
        break;
      }
    }
    for (int i = 0; i < pet.hamster['name']!.length; i++) {
      if (text == pet.hamster['name']![i]) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PetPage(
                  breed: pet.hamster['breed']![i],
                  image: pet.hamster['image']![i],
                  category: pet.hamster['category']![0],
                  name: pet.hamster['name']![i],
                )));
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final _search = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.25,
            child: Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.25 - 20,
                  decoration: BoxDecoration(
                    color: Colors.cyan.shade900,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 30.0,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: TextField(
                    onSubmitted: (text) => {
                      checkInput(_search.text, context),
                      _search.clear(),
                    },
                    controller: _search,
                    autocorrect: false,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      icon: Icon(Icons.search),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 25.0,
                  child: Container(
                    margin: EdgeInsets.only(left: 30.0, bottom: 20.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Pet Category',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Category('Dog', Colors.brown.shade200, 'assets/dogicon.png'),
                  Category('Cat', Colors.grey.shade200, 'assets/caticon.png'),
                ],
              ),
              Row(
                children: <Widget>[
                  Category('Bird', Colors.pink.shade200, 'assets/birdicon.png'),
                  Category('Hamster', Colors.orange.shade800,
                      'assets/hamstericon.png'),
                ],
              ),
            ],
          ),
          Container(
            height: 300.0,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PetPage(
                                  image: pet.displaypet['image']![index],
                                  name: pet.displaypet['name']![index],
                                  breed: pet.displaypet['breed']![index],
                                  category: pet.displaypet['category']![0],
                                )));
                      },
                      child: Card(
                        margin: EdgeInsets.all(10.0),
                        elevation: 5.0,
                        shadowColor: Colors.cyan.shade900,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              width: 130.0,
                              height: 170.0,
                              child: Image.asset(
                                pet.displaypet['image']![index],
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: 14.0,
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: Colors.cyan.shade900,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),
                                  )),
                              height: 96.0,
                              width: 190.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pet.displaypet['name']![index],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 3.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.0,
                                  ),
                                  Text(
                                    pet.displaypet['breed']![index],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 2.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  // Text(
                                  //   'Category',
                                  //   style: TextStyle(
                                  //     color: Colors.white,
                                  //     fontSize: 14.0,
                                  //     fontWeight: FontWeight.w300,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.only(left: 7.0),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.cyan.shade900,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0)),
            width: size.width,
            height: 90.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Vets near you'),
                    Text('Location'),
                    Text('Contact'),
                  ],
                ),
                Container(
                  width: 100.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(10.0),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => OpenMap()));
                    },
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(10.0)),
                      child: Image.asset(
                        'assets/map.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OpenMap extends StatefulWidget {
  const OpenMap({Key? key}) : super(key: key);

  @override
  _OpenMapState createState() => _OpenMapState();
}

class _OpenMapState extends State<OpenMap> {
  late GoogleMapController _map;

  final CameraPosition _initPosition =
      CameraPosition(target: LatLng(18.9917984, 72.8404874));

  late final List<Marker> marker = [];

  int id = 1;

  addmarker(cordinate) {
    setState(() {
      marker
          .add(Marker(markerId: MarkerId(id.toString()), position: cordinate));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black54,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: GoogleMap(
        initialCameraPosition: _initPosition,
        markers: marker.toSet(),
        mapType: MapType.normal,
        onMapCreated: (controller) {
          setState(() {
            _map = controller;
          });
        },
        onTap: (cordinate) {
          _map.animateCamera(CameraUpdate.newLatLng(cordinate));
          addmarker(cordinate);
        },
      ),
    );
  }
}
