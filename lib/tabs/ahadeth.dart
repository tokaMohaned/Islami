// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled/hadithModel.dart';
import 'package:untitled/provider/ahadeth_provider.dart';

import '../hadeth_details.dart';

class ahadethTab extends StatelessWidget {
  ahadethTab({Key? key}) : super(key: key);
  //List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {

    // if(allAhadeth.isEmpty)
    // {
    //   loadHadithFile();
    // }
    return ChangeNotifierProvider(
      create: (context)=>AhadethProvider()..loadHadithFile(),
      builder: (context, child)
      {
        var provider=Provider.of<AhadethProvider>(context);
        return Center(
          child: Column(
            children: [
              Image.asset("assets/images/hadithIcon.png"),
              Expanded(
                child: ListView.separated(
                  itemCount: provider.allAhadeth.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,
                            HadethDetails.routName,arguments: provider.allAhadeth[index]);
                        //argument is the context, it is help me to send the content form screen to another
                      },
                      child: Text(
                        provider.allAhadeth[index].title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 18
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    color: Theme.of(context).primaryColor,
                    thickness: 1,
                    endIndent: 35,
                    indent: 35,
                  ),
                ),
              ),
            ],
          ),
        );},

    );
  }

// void loadHadithFile() {
//   //String hadethFile=await
//   rootBundle.loadString("assets/files/ahadeth.txt").then((value)
//       //i load all ahdeth
//       {
//     List<String> AhadethContent = value.split("#"); //split each hadeth
//     //trim to remove the space the we didn't need
//     // print(AhadethContent[0].trim());
//     // print(AhadethContent[1]);
//
//     for(int i=0; i<AhadethContent.length;i++)
//       {
//         //انا عيزه اقطع الجزء بتاع العنوان بتاع الحديث
//         int LastIndexOfFirstLine=AhadethContent[i].trim().indexOf("\n");
//         String title=AhadethContent[i].trim().//remove spaces
//         substring(0,LastIndexOfFirstLine);//substring take string from
//         //index 0 until new line  \n
//         print(title);
//         String contet=AhadethContent[i].
//         trim().substring(LastIndexOfFirstLine+1);
//         HadethModel hadethModel=HadethModel(title, contet);
//         allAhadeth.add(hadethModel);
//         //print(contet);
//         setState(() {
//
//         });
//
//       }
//
//
//     //another way for the loop
//
//     // for (int i = 0; i < AhadethContent.length; i++) {
//     //   List<String> HadithLines = AhadethContent[i].trim().split("\n");
//     //   //انا باخد كل سطر من  الحديث و احطه لحاله
//     //   String title = HadithLines[0]; //i want to take the titiel of the hadith
//     //   HadithLines.removeAt(0); //مسحت العنوان عشان اضيف المحتوى
//     //   List<String> contect = HadithLines;
//     //   // print(title);
//     //   // print(contect);
//     //   // print("------------");
//     //   HadethModel hadethModel = HadethModel(title, contect);
//     //   allAhadeth.add(hadethModel);
//     // }
//     setState(() {});
//   }).catchError((error) {
//     print(error);
//   });
// }

//andther way for the

}
