import 'package:flutter/material.dart';

//on customise les champs de saisie
const textInputDecoration = InputDecoration(
  //intérieur champs de saisie blanc
  fillColor: Colors.white,
  // champs completement rempli
  filled: true,
  // padding qui permet que se soit pas collé au bord
  contentPadding: EdgeInsets.all(12.0),
  // si j'ai une erreur
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
        color: Colors.red, width: 1.0
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
        color: Colors.red, width: 1.0
    ),
  ),
  //bordure bleu grise
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
        color: Colors.blueGrey, width: 1.0
    ),
  ),
  // quand c'est focus(quand on saisie quelque chose)
  //le champ sera bleu
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
        color: Colors.blue, width: 1.0
    ),
  ),
);