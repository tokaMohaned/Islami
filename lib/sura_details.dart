import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/sura_detials_provider.dart';
import 'package:untitled/suraDetailsArgs.dart';

class SuraDetails extends StatelessWidget {
  static const String routName="sura-detials";

  const SuraDetails({Key? key}) : super(key: key);

  //List<String> verses=[];//i will put the sura details here
  @override
  Widget build(BuildContext context) {
    //var provider=Provider.of<SuraDetailsProvider>(context);
    //انا بعت الداتا في نافيجيشن عشان استقبلها استخدمت ارجس
    var args=ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;//suradetials args it is class contian sura name and index
    // if(provider.verses.isEmpty)//i make this function to not loop happen
    //   {
    //     provider.loadFile(args.index);
    //   }


    return ChangeNotifierProvider(
      create: (context)=>SuraDetailsProvider()..loadFile(args.index),
      builder:(context, child) {
        var provider=Provider.of<SuraDetailsProvider>(context);

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
              body: provider.verses.isEmpty?
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

              Flex(
                  direction: Axis.vertical,
                  children:
                  [ Expanded(child: ListView(children: [
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
                        textAlign: provider.verses.length<=20?
                        TextAlign.center:TextAlign.justify,
                        text: TextSpan(//text span used for long paragraph
                            children: [
                              for(var i=0; i<provider.verses.length;i++)...
                              {
                                TextSpan( text: "${provider.verses[i]}",
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
                  ] ),
            )

        );

      }  ,

    );
    // );
  }
}
