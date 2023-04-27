import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/tabs/ahadeth.dart';
import 'package:untitled/tabs/qran.dart';
import 'package:untitled/tabs/radio.dart';
import 'package:untitled/tabs/sebha.dart';

class HomeScreen  extends StatefulWidget {
   static const String routName="home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   //HomeScreen ({Key? key}) : super(key: key);
int index=0;
List<Widget> tabs=
[Qran_tab(),SebhaTab(),RadioTab(),ahadethTab()];

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children:[
        SizedBox(width: double.infinity,
            child:
            Image.asset("assets/images/mainpg.png",
              fit: BoxFit.fill,) ),
        Scaffold(
        appBar: AppBar(
          title: Text("اسلامي",style:
              Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w100,
              ),
             ),
        ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value){
              index=value;
              setState(() {

              });
            },
            items: [//minimum is 2 and max5 items
              BottomNavigationBarItem(
                  icon:
                  ImageIcon(AssetImage("assets/images/radio.png")),
              label: "radio",
                backgroundColor: Theme.of(context).primaryColor,
              ),

              BottomNavigationBarItem(
                  icon:
                  ImageIcon(AssetImage("assets/images/sebha.png")),
                  label: "sebha",
                backgroundColor: Theme.of(context).primaryColor,

    ),

              BottomNavigationBarItem(
                  icon:
                  ImageIcon(AssetImage("assets/images/quran.png")),
                  label: "qran",
                backgroundColor: Theme.of(context).primaryColor,

              ),

              BottomNavigationBarItem(
                  icon:
                  ImageIcon(AssetImage("assets/images/quran-quran-svgrepo-com.png")),
                  label: "ahadeth",
                backgroundColor: Theme.of(context).primaryColor,

              ),


            ],
          ),

          body: tabs[index],//to change between tabs
      ),
   ] );
  }
}
