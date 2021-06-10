import 'package:flutter/material.dart';
import 'package:poziomic_app/pages/home.dart';
import 'package:poziomic_app/pages/poziom.dart';
import 'package:poziomic_app/pages/author.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
    '/poziom': (context) => Poziom(),
    '/author': (context) => Author(),
  },
));