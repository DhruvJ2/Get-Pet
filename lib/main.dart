import 'package:flutter/material.dart';
import 'package:pet_adopter/UI/body.dart';
import 'package:pet_adopter/cover.dart';
import 'package:pet_adopter/login.dart';
import 'package:pet_adopter/signup.dart';
// import 'package:pet_adopter/login.dart';

void main() => runApp(PetAdopter());

class PetAdopter extends StatelessWidget {
  const PetAdopter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Adopter',
      // home: HomePage(),
      // home: CoverPage(),
      // home: LoginPage(),
      home: SignUpPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.cyan.shade900,
          title: Text(
            'Get Pet',
            style: TextStyle(
                letterSpacing: 3.0,
                fontSize: 30.0,
                fontWeight: FontWeight.w100),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_rounded),
            splashColor: Colors.cyan.shade700,
            iconSize: 20.0,
            color: Colors.white,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
              splashColor: Colors.cyan.shade700,
              iconSize: 20.0,
              color: Colors.white,
            ),
          ],
        ),
        body: HomePageBody(),
      ),
    );
  }
}
