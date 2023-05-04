
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData{
  //بلته الالوان بتاعت المشروع
  static const Color lightColor=Color(0xFFB7935f);

  /////////
  static ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: lightColor,
    appBarTheme:const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: lightColor
      )
    ),

      textTheme: const TextTheme(
        bodySmall:
        //GoogleFonts.elMessiri(),
        TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: lightColor,

        ),
        bodyMedium: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: lightColor,
      ),
        bodyLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),


      ),


bottomNavigationBarTheme: BottomNavigationBarThemeData(
  backgroundColor: lightColor,
  type: BottomNavigationBarType.fixed,
  selectedItemColor: Colors.black,
  selectedLabelStyle: TextStyle(color: Colors.black),
  unselectedItemColor: Colors.white,
  unselectedLabelStyle: TextStyle(color: Colors.white),
)


  );


  static ThemeData darkTheme=ThemeData();//it is object of kind themeData

}