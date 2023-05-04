import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/suraDetailsArgs.dart';

class SuraDetails extends StatefulWidget {
  static const String routName="sura-detials";

  const SuraDetails({Key? key}) : super(key: key);

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses=[];//i will put the sura details here
  @override
  Widget build(BuildContext context) {
    //انا بعت الداتا في نافيجيشن عشان استقبلها استخدمت ارجس
    var args=ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if(verses.isEmpty)//i make this function to not loop happen
      {
        loadFile(args.index);
      }


    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/mainpg.png"),
        fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text( args.suraName, style:
            Theme.of(context).textTheme.bodyMedium,),
        ),
        body: verses.isEmpty?
        Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),):
        ListView.separated(
          itemBuilder: (context,index){
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Center(child:
            Text(
              "${verses[index]}${index+1}",style: GoogleFonts.elMessiri(
                fontSize: 20,
            color: Color(0xff242424)),
              textAlign: TextAlign.center,)),
          );
        },
        itemCount: verses.length ,

        separatorBuilder: ( context,  index) =>Divider(
          thickness: 1,
            endIndent: 40,
            indent: 40,
          color: Theme.of(context).primaryColor,
        )

        ,),

      ),
    );
  }

Future <List<String>> loadFile(int index)async
{
  String sura=await rootBundle.loadString("assets/files/${index+1}.txt");
List<String> lines=sura.split("\n");
print(lines);
 verses=lines;
return lines;
}
}
