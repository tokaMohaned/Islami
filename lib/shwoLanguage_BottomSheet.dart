import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/my_provider.dart';

class ShowLanguageBottomSheet extends StatelessWidget {
  const ShowLanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Column(
      children: [
        InkWell(
          onTap: ()
          {
               provider.changeLang("en");
               Navigator.pop(context);
          },
          child: Row(
            children: [
              Text(
                "English",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color:
                provider.language=="en"?Theme.of(context).primaryColor:Colors.black),
              ),
              Spacer(),
              Icon(
                Icons.done,
                size: 30,
                color: provider.language == "en"
                    ? Theme.of(context).primaryColor
                    : Colors.black54,
              ),
            ],
          ),
        ),
        SizedBox(height: 5,),

        InkWell(
          onTap: ()
          {
            provider.changeLang("ar");
            Navigator.pop(context);

          },
          child: Row(
            children: [
              Text(
                "Arabic",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color:
                provider.language!="en"?Theme.of(context).primaryColor:Colors.black),
              ),
              Spacer(),
              Icon(
                Icons.done,
                size: 30,
                color: provider.language != "en"
                    ? Theme.of(context).primaryColor
                    : Colors.black54,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
