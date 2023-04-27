import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/suraDetailsArgs.dart';

class SuraDetails extends StatelessWidget {
  static const String routName="sura-detials";
  const SuraDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //انا بعت الداتا في نافيجيشن عشان استقبلها استخدمت
    var args=ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/mainpg.png"),
        fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text( args.suraName, style:
            Theme.of(context).textTheme.bodyMedium,),
        ),

      ),
    );
  }
}
