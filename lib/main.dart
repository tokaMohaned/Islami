
 // import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/home%20screen.dart';
import 'package:untitled/provider/my_provider.dart';
import 'package:untitled/sura_details.dart';
import 'package:untitled/tabs/hadeth_details.dart';
import 'package:untitled/tabs/qran.dart';

 import 'package:flutter_gen/gen_l10n/app_localizations.dart';

 import 'MyThemeData.dart';

void main()
 {

   runApp(ChangeNotifierProvider(
     create: (context)=> MyProvider(),//it is one obj of the provider and i can access to this obj from anywhere fo the project so it is call singleton designe patter
       //so i have to mame one obj and access it from anywhere
       child: MyApplication()));
 }

 class MyApplication extends StatelessWidget {
    MyApplication({Key? key}) : super(key: key);
   late MyProvider provider;// i make this to can see the provider obje in the function of shared prference and i can't put the


   @override
   Widget build(BuildContext context) {
     provider=Provider.of<MyProvider>(context);//this line iside the build becase it is need context
     initSharedPref();
     return MaterialApp(
       debugShowCheckedModeBanner:false,
       localizationsDelegates: [
         AppLocalizations.delegate,
         GlobalMaterialLocalizations.delegate,
         GlobalWidgetsLocalizations.delegate,
         GlobalCupertinoLocalizations.delegate,
       ],
       supportedLocales: [
         Locale("en"), // English
         Locale("ar"), // arabic
       ],
       locale: Locale(provider.language),//i can fix the lanuge of the app by using this attribute

       theme: MyThemeData.lightTheme,
       darkTheme: MyThemeData.darkTheme,
       themeMode: provider.themeMode, //لو انا عيزه اثبت المود

       initialRoute:HomeScreen.routName ,
       routes: {
         HomeScreen.routName:(context)=>HomeScreen(),
         Qran_tab.routName:(c)=>Qran_tab(),
         SuraDetails.routName:(c)=>SuraDetails(),
         HadethDetails.routName:(c)=>HadethDetails(),




       },

     );
   }

   void initSharedPref()async
   {
     final prefs=await SharedPreferences.getInstance();
     String theme=prefs.getString('mode')??'light';
     String lang=prefs.getString('lang')??'en';// i have to put default value becuse fist time of open the app it will set null value
   if(theme=="light"){
     provider.changeTheme(ThemeMode.light);
   }
   else if(theme=='dark'){
     provider.changeTheme(ThemeMode.dark);
     }
   }
 }
