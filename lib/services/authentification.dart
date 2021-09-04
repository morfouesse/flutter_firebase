import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/models/user.dart';


class AuthenticationService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // on gere ici le cas d'un user null et non dans le modele
  AppUser? _userFromFirebaseUser(User? user){

    return user != null ? AppUser(user.uid) : null;
  }
  // avec le stream on récupere l'utilisateur courant
  // et à ecouter quand le user se déco ou se co
  Stream<AppUser?> get user {
    // a chaque fois que l'on est co ou pas co
    // alors le stream va le notifier
    // ensuite  on le convertie en  AppUser pour pas avoir
    // un user de firebase
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // retourne un utilisateur
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      //Credential pour les objets de firebase
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      return _userFromFirebaseUser(user);

    }// pour gerer les erreurs de firebase
    catch(exception){
      print(exception.toString());
      return null;
    }
  }

  // retourne un utilisateur
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      //Credential pour les objets de firebase
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      return _userFromFirebaseUser(user);

      //TODO firestore

    } // pour gerer les erreurs de firebase
    catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch (exception) {
      print(exception.toString());
      return null;
    }
  }
}