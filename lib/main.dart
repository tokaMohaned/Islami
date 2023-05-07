
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/home%20screen.dart';
import 'package:untitled/sura_details.dart';
import 'package:untitled/tabs/hadeth_details.dart';
import 'package:untitled/tabs/qran.dart';

import 'MyThemeData.dart';

void main()
 {
   runApp(MyApplication());
 }

 class MyApplication extends StatelessWidget {
   const MyApplication({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner:false,
       theme: MyThemeData.lightTheme,
       darkTheme: MyThemeData.darkTheme,
       //themeMode: ThemeMode.light, لو انا عيزه اثبت المود

       initialRoute:HomeScreen.routName ,
       routes: {
         HomeScreen.routName:(context)=>HomeScreen(),
         Qran_tab.routName:(c)=>Qran_tab(),
         SuraDetails.routName:(c)=>SuraDetails(),
         HadethDetails.routName:(c)=>HadethDetails(),




       },

     );
   }
 }
