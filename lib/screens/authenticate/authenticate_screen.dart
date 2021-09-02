import 'package:flutter/material.dart';
import 'package:flutter_firebase/common/constante.dart';
import 'package:flutter_firebase/common/loading.dart';

class AuthenticateScreen extends StatefulWidget {
  @override
  _AuthenticateScreenState createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  // pour valider les champs de saisie et voir si ils sont vide
  final _formKey = GlobalKey<FormState>();
  String error = '';
  //loading permet de rafraichir la vue quand c'est à true
  // et de mettre un loader(logo) sur la vue
  bool loading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showSignIn = true;


  // on vide la memoire pour reutiliser l'objet
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // on va l'appeler pour le bouton tout en haut à droite
  // pour faire un switch entre signIn et Register
  void toggleView(){
    setState(() {
      //metre à jour les erreurs dans un formualire
      // en reinitialisant tout le formulaire
      // car on utilise se formulaire dans register et sign in
      _formKey.currentState!.reset();
      error = '';
      emailController.text = '';
      passwordController.text = '';
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    //loading permet de rafraichir la vue quand c'est à true
    // et de mettre un loader(logo) sur la vue
    //appelle d'une classe avec des parenthese en Dart
    return loading ? Loading() :
    Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0.0,
          title: Text(
            showSignIn ? 'Sign in to water Social'
                : 'Register',
          ),
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(
                  Icons.person,
                  color: Colors.white
              ),
              //TODO: à changer
              label: Text(showSignIn ? 'Sign in to water Social'
                  : 'Register',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              //onPressed cree un button avec du text
              //toggleView initialise le form
              onPressed: () => toggleView(),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 30.0
          ),
          child: Form(
            key: _formKey,
            // ListView à la place d'une Column
            // avantage en monde horizontale:
            // //tu peux scroller pour aller sur l'input
            // en dessous
            child: ListView(
              children: [
                TextFormField(
                  controller: emailController,
                  //placeholder avec un copyWith(hintText:)
                  decoration: textInputDecoration.copyWith(hintText: 'email'),
                  validator: (value) => value!.isEmpty ?
                  "Enter an email" : null,
                ),
                //separateur de form
                SizedBox(height: 10.0),
                TextFormField(
                  controller: passwordController,
                  // constante pour le style d'un champ
                  decoration: textInputDecoration.copyWith(hintText: 'password'),
                  obscureText: true,
                  validator: (value) =>
                      // minimum pour firebase 5 caracteres
                      value!.length < 6 ?
                  "Enter a password with at least 6 characteres" :
                  null,
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  child: Text(
                    showSignIn ? "Sign In" : "Register",
                    style: TextStyle(color:Colors.white),
                  ),
                  onPressed: () {
                    // on valide le formulaire
                      if(_formKey.currentState!.validate()){
                        // on va faire une anim de chargement
                        setState(() => loading = true);
                        var password = passwordController.value.text;
                        var email = emailController.value.text;

                        // TODO cale firebase auth
                        // on fit semblant d'appeler firebase pour linstant
                        dynamic result = null;
                        // si l'appelle à firebase echoue alors message derreur
                        if(result == null){
                          setState(() {
                            loading = false;
                            error = "Please supply a valid email";
                          });
                        }
                      }
                  },
                ),
                SizedBox(height: 10.0),
              Text(
                    error,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                    ),
                  ),
              ],
            ),
          ),
        )
    );
  }
}
