
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData{
  //بلته الالوان بتاعت المشروع
  static const Color lightColor=Color(0xFFB7935f);
  static const Color darkColor=Color(0xFF141A2E);
  static const Color yelloColor=Color(0xFFFACC1D);


  /////////
  static ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: lightColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: lightColor,
      onPrimary:Colors.black ,
      secondary:Colors.grey ,
      onSecondary:Colors.black,
      error: Colors.red,
      onError:Colors.white ,
      background: Colors.transparent,
      onBackground:lightColor ,
      surface:Colors.white ,
      onSurface: Colors.black,
    ),
    appBarTheme:const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: lightColor
      )
    ),

      textTheme:  TextTheme(
        bodySmall:
        //GoogleFonts.elMessiri(),
        GoogleFonts.elMessiri(
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


  static ThemeData darkTheme=ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: darkColor,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: darkColor,
        onPrimary:Colors.white ,
        secondary:yelloColor ,
        onSecondary:Colors.white,
        error: Colors.red,
        onError:Colors.white ,
        background: Colors.transparent,
        onBackground:darkColor ,
        surface: darkColor,
        onSurface: yelloColor,
      ),

      appBarTheme:const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(
              color: Colors.white,
            size: 30,
          )
      ),

      textTheme:  TextTheme(
        bodySmall:
        //GoogleFonts.elMessiri(),
        GoogleFonts.elMessiri(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: yelloColor,

        ),
        bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: yelloColor,
        ),
        bodyLarge:
        GoogleFonts.amiri(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),


      ),


      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: darkColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: yelloColor,
        selectedLabelStyle: TextStyle(color: yelloColor),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(color: darkColor),
      )


  );//it is object of kind themeData

}