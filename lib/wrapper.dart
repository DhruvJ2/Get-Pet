import 'package:flutter/material.dart';
import 'package:pet_adopter/authentication/authentication.dart';
import 'package:pet_adopter/main.dart';
import 'package:pet_adopter/models/user.dart';
import 'package:pet_adopter/services/auth.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<MyUser?>(context);

    if (_user == null)
      return Authenticate();
    else
      return HomePage();
  }
}
