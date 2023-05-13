import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/hadithModel.dart';

class HadethDetails extends StatelessWidget {
  static const String routName="hadeth_details";
  const HadethDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as HadethModel;
    return  Container(
        decoration:  BoxDecoration(
        image: DecorationImage(
            image:  AssetImage(
              Theme.of(context).colorScheme.brightness == Brightness.light
                  ? "assets/images/mainpg.png"
                  : "assets/images/dark_background.png",
              ),
          fit: BoxFit.fill,




        ),
    ),
    child: Scaffold(
    appBar: AppBar(
    title: Text( args.title, style:
    Theme.of(context).textTheme.bodyMedium,),
    ),
    body:
        SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
                side: BorderSide(
                  color: Theme.of(context).primaryColor
                )
              ),
              elevation: 12,
              margin: EdgeInsets.all(12),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(args.content,
                    textDirection: TextDirection.rtl,
                  style:
                Theme.of(context).textTheme.bodySmall,),
              ),
            ),
          ),
        )
    ),);
  }
}
