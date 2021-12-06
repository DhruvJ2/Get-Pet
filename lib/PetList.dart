import 'package:flutter/material.dart';
import 'package:pet_adopter/UI/category.dart';
import 'package:pet_adopter/addpet.dart';
import 'package:pet_adopter/models/listmodel.dart';
import 'package:pet_adopter/pet.dart';

class PetList extends StatelessWidget {
  String category;
  PetList({Key? key, required this.category}) : super(key: key);

  PetListModel pets = PetListModel();

  late List<String>? imageList;
  late List<String>? nameList;
  late List<String>? breedList;

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    switch (category) {
      case 'Dog':
        imageList = pets.dog['image'];
        nameList = pets.dog['name'];
        breedList = pets.dog['breed'];
        break;
      case 'Cat':
        imageList = pets.cat['image'];
        nameList = pets.cat['name'];
        breedList = pets.cat['breed'];
        break;
      case 'Bird':
        imageList = pets.bird['image'];
        nameList = pets.bird['name'];
        breedList = pets.bird['breed'];
        break;
      case 'Hamster':
        imageList = pets.hamster['image'];
        nameList = pets.hamster['name'];
        breedList = pets.hamster['breed'];
        break;
      default:
    }

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
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
      body: Column(
        children: [
          Container(
            height: 40.0,
            width: _size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton.icon(
                  padding: EdgeInsets.all(7.0),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.cyan.shade900,
                  ),
                  label: Text(
                    'Back',
                    style: TextStyle(color: Colors.cyan.shade900),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(7.0),
                  child: Icon(
                    Icons.filter,
                    color: Colors.cyan.shade900,
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 5.0,
            indent: 20.0,
            endIndent: 20.0,
            color: Colors.cyan.shade900,
            thickness: 0.7,
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            height: _size.height * 0.80,
            width: _size.width - 20,
            child: ListView.builder(
              itemCount: imageList!.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PetPage(
                              breed: breedList![index],
                              image: imageList![index],
                              name: nameList![index],
                              category: category,
                            )));
                  },
                  child: Card(
                    elevation: 0.0,
                    child: Container(
                      height: 160.0,
                      width: _size.width - 30,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 10.0,
                            bottom: 20.0,
                            left: 125.0,
                            child: Container(
                              width: _size.width - 160,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.cyan.shade900,
                                    offset: Offset(1, 1),
                                    blurRadius: 1.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(10.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0,
                                  vertical: 10.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: _size.width * 0.35,
                                          child: Text(
                                            nameList![index],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 26,
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: 3.0,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.favorite_outline),
                                          color: Colors.white,
                                          iconSize: 22,
                                          onPressed: () {},
                                        )
                                      ],
                                    ),
                                    Text(
                                      '18 years',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 3.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      breedList![index],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 3.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 150.0,
                            width: 130.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1, 1),
                                  blurRadius: 1.0,
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                imageList![index],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
