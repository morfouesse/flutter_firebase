import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/authenticate/authenticate_screen.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        home:AuthenticateScreen(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      );
  }
}
