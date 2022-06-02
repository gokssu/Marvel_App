
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marvel_app/view/heroes_list.dart';
import 'package:marvel_app/view/theme/theme.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().theme,
      debugShowCheckedModeBanner: false,
      title: 'Marvel Heroes',
      home: HeroList(),
    );
  }
}
