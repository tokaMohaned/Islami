import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ahadethTab extends StatelessWidget {
  const ahadethTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
    itemCount:2, itemBuilder: (BuildContext context, int index) {  } ,
    );
  }
  void loadHadith()async
  {
    // String hadethFile=await
    rootBundle.loadString("assets/files/ahadeth .txt").then
      ((value) {
      List<String>AhadethContent=value.split("#");
      //trim to remove the space the we didn't need
      print(AhadethContent[0].trim());
      print(AhadethContent[1]);
      for(int i=0; i<AhadethContent.length;i++)
        {
          List<String>HadithLines=AhadethContent[i].trim().split("\n");
          String title=HadithLines[0];
          HadithLines.removeAt(0);//مسحت العنوان عشان اضيف المحتوى
          List<String> contect=HadithLines;
          print(title);
          print(contect);
          print("------------");

        }

    });
}
}
