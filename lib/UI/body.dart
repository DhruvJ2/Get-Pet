import 'package:flutter/material.dart';
import 'package:pet_adopter/UI/category.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var images = [
      'assets/dog.jpg',
      'assets/dog2.jpg',
      'assets/Dog 1.jpg',
      'assets/cat.jpg',
      'assets/hamster1.jpg',
      'assets/hamster2.jpg',
      'assets/bird.jpg',
    ];
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
                Positioned(
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: TextField(
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
                  Category('Dogs', Colors.brown.shade200),
                  Category('Cats', Colors.grey.shade200),
                ],
              ),
              Row(
                children: <Widget>[
                  Category('Birds', Colors.yellow.shade200),
                  Category('Hamsters', Colors.pink.shade200),
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
                                '${images[index]}',
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: 14.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.cyan.shade900,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),
                                  )),
                              height: 96.0,
                              width: 190.0,
                              child: Column(
                                children: [
                                  Text(
                                    'name',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    'breed',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    'Category',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    'Favourite',
                                    style: TextStyle(color: Colors.white),
                                  )
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
            padding: EdgeInsets.all(7.0),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.cyan.shade900,
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(10.0)),
            width: size.width,
            height: 90.0,
            child: Row(
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
                // Image(image: ''),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
