import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/user.dart';
import 'package:flutter_firebase/screens/authenticate/authenticate_screen.dart';
import 'package:flutter_firebase/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class SplashScreenWrapper extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // on récupere le user courant
    final user = Provider.of<AppUser?>(context);
    //var userUid = user!.uid;
    //log('user: $userUid');
    // si il y a pas d'utilisateur alors il
    // va sur la page de connection/ inscription
    // sinon page d'accueil
    if(user == null){
      return AuthenticateScreen();
    } else{
      return HomeScreen();
    }
  }
}
