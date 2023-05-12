import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/tabs/ahadeth.dart';
import 'package:untitled/tabs/qran.dart';
import 'package:untitled/tabs/radio.dart';
import 'package:untitled/tabs/sebha.dart';
import 'package:untitled/tabs/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
  static const String routName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //HomeScreen ({Key? key}) : super(key: key);
  int index = 0;
  List<Widget> tabs = [
    Qran_tab(),
    SebhaTab(),
    RadioTab(),
    ahadethTab(),
    Setting_tab()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
          width: double.infinity,
          child: Image.asset(
            Theme.of(context).colorScheme.brightness == Brightness.light
                ? "assets/images/mainpg.png"
                : "assets/images/dark_background.png",
            fit: BoxFit.fill,
          )),
      Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.appTitle,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w100,
                ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: [
            //minimum is 2 and max5 items

            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/quran.png")),
              label: AppLocalizations.of(context)!.quran,
              backgroundColor: Theme.of(context).primaryColor,
            ),

            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/sebha.png")),
              label: AppLocalizations.of(context)!.sebha,
              backgroundColor: Theme.of(context).primaryColor,
            ),

            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/radio.png")),
              label: AppLocalizations.of(context)!.radio,
              backgroundColor: Theme.of(context).primaryColor,
            ),

            BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage("assets/images/quran-quran-svgrepo-com.png")),
              label: AppLocalizations.of(context)!.ahadeth,
              backgroundColor: Theme.of(context).primaryColor,
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: //"setting",
              AppLocalizations.of(context)!.setting,
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ],
        ),

        body: tabs[index], //to change between tabs
      ),
    ]);
  }
}
