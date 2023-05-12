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
    var args=ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;//suradetials args it is class contian sura name and index
    if(verses.isEmpty)//i make this function to not loop happen
      {
        loadFile(args.index);
      }


    return Container(
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
          title: Text( args.suraName, style:
            Theme.of(context).textTheme.bodyMedium,),
        ),
        body: verses.isEmpty?
        Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),):
        // ListView.separated(
        //   itemBuilder: (context,index){
        //   return Directionality(
        //     textDirection: TextDirection.rtl,
        //     child: Center(child:
        //     Text(
        //       "${verses[index]}${index+1}",style: GoogleFonts.elMessiri(
        //         fontSize: 20,
        //     color: Color(0xff242424)),
        //       textAlign: TextAlign.center,)),
        //   );
        // },
        // itemCount: verses.length ,
        //
        // separatorBuilder: ( context,  index) =>Divider(
        //   thickness: 1,
        //     endIndent: 40,
        //     indent: 40,
        //   color: Theme.of(context).primaryColor,
        // )
        //
        // ,),

        SizedBox(
          child: Expanded(child: ListView(children: [
            Center(
              child: Text("بسم الله الرحمن الرحيم",style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 25,fontWeight: FontWeight.bold
                ),),
            ),
            const SizedBox(height: 10,),
            RichText(
                textDirection: TextDirection.rtl,
                //لو الايات اصغر من او تساوي 20 هيعرضها في المنتصف غير كدا هتكون تحت بعض في محاذاه بعض
                textAlign: verses.length<=20?
                TextAlign.center:TextAlign.justify,
                text: TextSpan(//text span used for long paragraph
                  children: [
                    for(var i=0; i<verses.length;i++)...
                      {
                        TextSpan( text: "${verses[i]}",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: "\u06dd${i+1}",
                          style: GoogleFonts.amiri(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 25,
                          ),
                        ),

                      }
                  ]


                ))
          ],)),
        )

      ),
    );
  }

    // void  loadFile (int index)async
    // {try{
    //   String sura=await rootBundle.loadString("assets/files/${index+1}.txt");
    // List<String> lines=sura.split("\n");
    // print(lines);
    //  verses=lines;
    // //return lines;
    //
    // }
    // catch(error){print(error);
    //   rethrow;
    //   }
    //
    // }

  void loadFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index+ 1}.txt");
    List<String> lines = sura.split("\n");
    verses=lines;
    setState(() {

    });
    }


}
