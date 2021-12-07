
import 'package:flutter/material.dart';
import 'package:time_app/choose_location.dart';
import 'package:time_app/home.dart';
import 'package:time_app/loading.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      //Map  key:value
      '/': (context)=> Loading(),
      '/home' : (context)=> Home(),
      '/location': (context)=> ChooseLocation(),
    },
  ));
}

