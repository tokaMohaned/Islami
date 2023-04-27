
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SebhaTab extends StatelessWidget {
   SebhaTab({Key? key}) : super(key: key);
  int coutner=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/mainpg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("عدد التسبيحات"),
            Container(
              decoration: BoxDecoration(
               // borderRadius: BorderRadius.circular(30),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}
