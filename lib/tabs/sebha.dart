
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
   SebhaTab({Key? key}) : super(key: key);

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {

  int coutner=0;
 List <String> tasbeh=[
   "سبحان الله ",
   " الحمد الله",
   " لا اله الا الله ",
   " الله اكبر ",
 "لا حول و لا قوه الا بالله "];

 int index=0;
 double angle=0;

  @override
  Widget build(BuildContext context) {
    return
      Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/mainpg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                  alignment: Alignment.topCenter,
                  children:

              [
                Image.asset("assets/images/head of seb7a.png"),
                Transform.rotate(
                  angle: angle,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical:
                        MediaQuery.of(context).size.height*0.082),
                    child: GestureDetector
                      (
                        onTap:onTasbehTap ,
                        child:
                        Image.asset("assets/images/body of seb7a.png")
                    ),
                  ),
                ),
              ]
              ),
              const Text("عدد التسبيحات", style:
              TextStyle(fontSize: 25,
              fontWeight: FontWeight.w600
              ),

              ),


              Container(
                margin: EdgeInsets.only(top: 16),

                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                 // borderRadius: BorderRadius.circular(30),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(26),
                    color: Theme.of(context).primaryColor
                ),
                child:  Text(coutner.toString(), style:
                TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),

                ),
              ),


              Container(
                margin: EdgeInsets.only(top: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(30),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(26),
                    color: Theme.of(context).primaryColor
                ),
                child:  Text(
                 tasbeh[index],
                  style:
                TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

 void onTasbehTap()
  {
    coutner++;
    if(coutner % 33==0)
      {
        index++;
      }
    if(index==tasbeh.length)//if i reach to the last one
      {
        index=0;
      }
    angle+=360/33;  //كل33 عه بيلف 360
    print(coutner);
    setState(() {});
  }
}
