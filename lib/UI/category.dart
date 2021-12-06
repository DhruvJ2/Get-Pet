import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_adopter/PetList.dart';
import 'package:pet_adopter/addpet.dart';
import 'package:pet_adopter/cover.dart';
import 'package:pet_adopter/main.dart';
import 'package:pet_adopter/pet.dart';
import 'package:pet_adopter/services/auth.dart';

class Category extends StatelessWidget {
  Color _color;
  String category_name;
  String image;

  Category(this.category_name, this._color, this.image) {}

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PetList(
                    category: category_name,
                  )));
        },
        child: Container(
          height: 70,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.only(
            right: 8,
            left: 8,
            bottom: 8,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _color.withOpacity(0.5),
                ),
                child: Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                '${category_name}',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);
  AuthServices _auth = AuthServices();
  User? user = FirebaseAuth.instance.currentUser;
  get username => user!.displayName;
  get email => user!.email;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
            ),
            accountEmail: Text(email),
            accountName: Text(
              username,
              style: TextStyle(fontSize: 24.0),
            ),
            decoration: BoxDecoration(
              color: Colors.cyan.shade800,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.black87,
            ),
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 22.0),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          SizedBox(
            height: 10.0,
            child: Divider(
              thickness: 1.0,
              indent: 10.0,
              endIndent: 10.0,
              color: Colors.black38,
            ),
          ),
          ListTile(
            leading: Image.asset(
              'assets/d3.png',
              height: 40.0,
              width: 35.0,
              alignment: Alignment.topLeft,
            ),
            title: const Text(
              'Adopted pet',
              style: TextStyle(fontSize: 22.0),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AdoptPet()));
            },
          ),
          SizedBox(
            height: 10.0,
            child: Divider(
              thickness: 1.0,
              indent: 10.0,
              endIndent: 10.0,
              color: Colors.black38,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.add,
              color: Colors.black87,
            ),
            title: const Text(
              'Add Pet',
              style: TextStyle(fontSize: 22.0),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => addPet()));
            },
          ),
          SizedBox(
            height: 10.0,
            child: Divider(
              thickness: 1.0,
              indent: 10.0,
              endIndent: 10.0,
              color: Colors.black38,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.black87,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 22.0),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => addPet()));
            },
          ),
          SizedBox(
            height: 10.0,
            child: Divider(
              thickness: 1.0,
              indent: 10.0,
              endIndent: 10.0,
              color: Colors.black38,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.black87,
            ),
            title: Text(
              'SignOut',
              style: TextStyle(fontSize: 22.0),
            ),
            onTap: () async {
              await _auth.signOut();
              sleep(Duration(milliseconds: 1000));
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => CoverPage()));
            },
          ),
          SizedBox(
            height: 10.0,
            child: Divider(
              thickness: 1.0,
              indent: 10.0,
              endIndent: 10.0,
              color: Colors.black38,
            ),
          ),
        ],
      ),
    );
  }
}
