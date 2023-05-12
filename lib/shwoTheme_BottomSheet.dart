import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/my_provider.dart';

class ShowThemeBottomSheet extends StatelessWidget {
  const ShowThemeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    //i put provider int he bottome of the build because the build will provide the context
    return Column(
      children: [
        InkWell(
          onTap: ()
          {
               provider.changeTheme(ThemeMode.light);
               Navigator.pop(context);
          },
          child: Row(
            children: [
              Text(
                "Light",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color:provider.themeMode==ThemeMode.light?
                Theme.of(context).primaryColor:Colors.white),
                //if the them mode is light it will be in primaryColor else it will be white
              ),
              Spacer(),
              Icon(
                Icons.done,
                size: 30,
                color: provider.themeMode==ThemeMode.light?
                Theme.of(context).primaryColor:Colors.white,
              ),
            ],
          ),
        ),
        SizedBox(height: 5,),
        
        InkWell(
          onTap: ()
          {
            provider.changeTheme(ThemeMode.dark);
            Navigator.pop(context);

          },
          child: Row(
            children: [
              Text(
                "Dark",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: provider.themeMode==ThemeMode.dark?
                Colors.black54:Theme.of(context).colorScheme.secondary),
              ),
              Spacer(),
              Icon(
                Icons.done,
                size: 30,
                color: provider.themeMode==ThemeMode.dark?
                Colors.black54:Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
