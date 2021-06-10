import 'package:flutter/material.dart';
import 'package:poziomic_app/pages/home.dart';
import 'package:poziomic_app/pages/poziom.dart';

/***
 * Metoda inicjuje aplikację.
 */
void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
    '/poziom': (context) => Poziom(),
  },
));