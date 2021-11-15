import 'package:flutter/material.dart';
import 'package:pet_adopter/UI/body.dart';
import 'package:pet_adopter/UI/category.dart';
import 'package:pet_adopter/addpet.dart';
import 'package:pet_adopter/services/auth.dart';
import 'package:pet_adopter/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PetAdopter());
}

class PetAdopter extends StatelessWidget {
  const PetAdopter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices().user,
      initialData: null,
      child: MaterialApp(
        title: 'Get Pet',
        home: Wrapper(),
        // home: CoverPage(),
        // home: LoginPage(),
        // home: SignUpPage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: CustomDrawer(),
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
          // leading: IconButton(
          //   onPressed: () {
          //     CustomDrawer();
          //   },
          //   icon: Icon(Icons.menu_rounded),
          //   splashColor: Colors.cyan.shade700,
          //   iconSize: 20.0,
          //   color: Colors.white,
          // ),
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
        body: HomePageBody(),
      ),
    );
  }
}
