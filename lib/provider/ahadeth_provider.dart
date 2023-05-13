import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../hadithModel.dart';

class AhadethProvider extends ChangeNotifier{
  List<HadethModel> allAhadeth = [];

  void loadHadithFile() {
    //String hadethFile=await
    rootBundle.loadString("assets/files/ahadeth.txt").then((value)
    //i load all ahdeth
    {
      List<String> AhadethContent = value.split("#"); //split each hadeth
      //trim to remove the space the we didn't need
      // print(AhadethContent[0].trim());
      // print(AhadethContent[1]);

      for (int i = 0; i < AhadethContent.length; i++) {
        //انا عيزه اقطع الجزء بتاع العنوان بتاع الحديث
        int LastIndexOfFirstLine = AhadethContent[i].trim().indexOf("\n");
        String title = AhadethContent[i].trim(). //remove spaces
        substring(0, LastIndexOfFirstLine); //substring take string from
        //index 0 until new line  \n
        print(title);
        String contet = AhadethContent[i].
        trim().substring(LastIndexOfFirstLine + 1);
        HadethModel hadethModel = HadethModel(title, contet);
        allAhadeth.add(hadethModel);
        //print(contet);
        notifyListeners();
      }


      //another way for the loop

      // for (int i = 0; i < AhadethContent.length; i++) {
      //   List<String> HadithLines = AhadethContent[i].trim().split("\n");
      //   //انا باخد كل سطر من  الحديث و احطه لحاله
      //   String title = HadithLines[0]; //i want to take the titiel of the hadith
      //   HadithLines.removeAt(0); //مسحت العنوان عشان اضيف المحتوى
      //   List<String> contect = HadithLines;
      //   // print(title);
      //   // print(contect);
      //   // print("------------");
      //   HadethModel hadethModel = HadethModel(title, contect);
      //   allAhadeth.add(hadethModel);
      // }
      //setState(() {});}
    } ).catchError((error) {
      print(error);
    });
  }


}