import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkmode=ThemeData(
  scaffoldBackgroundColor:HexColor('#3C1A5B'),
  appBarTheme: AppBarTheme(
    backgroundColor: HexColor('#FCEDDA'),
    actionsIconTheme: IconThemeData(color: HexColor('#000000')),
  ),
  primarySwatch:Colors.deepOrange ,
  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: HexColor('#FBEAEB')),
    bodyText2: TextStyle(fontSize: 10,color:HexColor('#FBEAEB') ,),

  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('#FCEDDA'),
    selectedItemColor: HexColor('#F4A950'),
  ),
);
ThemeData lightmode=ThemeData(
  scaffoldBackgroundColor:HexColor('#f6f6f6'),

  appBarTheme: AppBarTheme(
    backgroundColor: HexColor('#f6f6f6'),


    elevation: 0,
    actionsIconTheme: IconThemeData(color: HexColor('#072C50')),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: HexColor('#161B21')),
    bodyText2: TextStyle(fontSize: 10,color:HexColor('#161B21') ,),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('#FCEDDA'),
    selectedItemColor: HexColor('#F4A950'),
  ),
  primarySwatch:Colors.purple ,

);