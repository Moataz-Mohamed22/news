import 'package:flutter/material.dart';

import 'package:news/UI/Home/Home_Screen.dart';
import 'package:news/utils/App_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:HomeScreen.routName ,
      routes:{
        HomeScreen.routName :(context)=>HomeScreen(),
      } ,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
