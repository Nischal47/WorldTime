import 'package:WorldTime/pages/choose_location.dart';
import 'package:WorldTime/pages/loading.dart';
import 'package:flutter/material.dart';
import 'Package:WorldTime/pages/home.dart';
import 'Package:WorldTime/pages/choose_location.dart';
import 'Package:WorldTime/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
