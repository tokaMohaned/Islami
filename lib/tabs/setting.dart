import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/my_provider.dart';
import 'package:untitled/shwoLanguage_BottomSheet.dart';

import '../shwoTheme_BottomSheet.dart';

class Setting_tab extends StatefulWidget {
  const Setting_tab({Key? key}) : super(key: key);

  @override
  State<Setting_tab> createState() => _Setting_tabState();
}

class _Setting_tabState extends State<Setting_tab> {
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<MyProvider>(context);
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        Text("Theming"),
        SizedBox(height: 4,),
        InkWell(
          onTap:(){
            showThemeSheet();
          } ,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color:Theme.of(context).primaryColor )
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                provider.themeMode==ThemeMode.light?"Light":"Dark",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.w200

              ),),
            ),
          ),
        ),
          SizedBox(height: 20,),


          Text("Language"),
          SizedBox(height: 4,),

          InkWell(
            onTap: showLanguageSheet,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color:Theme.of(context).primaryColor )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                 provider.language== "en"?"Engilsh": "عربي",//عملت ده عشان تتغير لما اخترا و يبان الاختيار
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w200

                ),),
              ),
            ),
          ),
      ],
      ),
    );
  }

  void showThemeSheet(){
    showModalBottomSheet(context: context,
       // isScrollControlled: true,//if i want the sheet to be cove full page
        builder: (context)
    {
      return ShowThemeBottomSheet(
       // height: MediaQuery.of(context).size.height*.9,
      );
    });
  }

  showLanguageSheet()
  {
    showModalBottomSheet(context: context,
        // isScrollControlled: true,//if i want the sheet to be cove full page
        builder: (context)
        {
          return ShowLanguageBottomSheet(
            // height: MediaQuery.of(context).size.height*.9,
          );
        });
  }
}
