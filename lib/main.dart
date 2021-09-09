import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'models/user.dart';
import 'package:flutter_firebase/screens/splashscreen_wrapper.dart';
import 'package:flutter_firebase/services/authentification.dart';
import 'package:provider/provider.dart';


 void main() async {
   // faire inisialiser firebase simplement
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   // si on est pas sur le web( ne fct pas sur le web)
 if (!kIsWeb) {
   await FirebaseCrashlytics.instance
       .setCrashlyticsCollectionEnabled(kDebugMode ? false : true);
   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
 }
   runApp(MyApp());
 }

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // on simule un crash
    //FirebaseCrashlytics.instance.crash();
    // on écoute le user grace au stream
    // pour avoir le user courant
      return StreamProvider<AppUser?>.value(
        value: AuthenticationService().user,
        initialData: null,
        child: MaterialApp(
          //switch de la home au formulaire d'enregistrement
          // en fct d'un user
          // tous les enfants vont pouvoir récuéré le user
          home: SplashScreenWrapper(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ),
      );
  }
}
