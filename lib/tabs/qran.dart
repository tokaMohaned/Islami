import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/my_provider.dart';
import 'package:untitled/suraDetailsArgs.dart';
import 'package:untitled/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Qran_tab extends StatelessWidget {
  static const String routName = "Qran";
   

  Qran_tab({Key? key}) : super(key: key);
  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/Screenshot (1).png"),
          Divider(
            color: provider.themeMode==ThemeMode.light?
            Theme.of(context).primaryColor:Theme.of(context).colorScheme.secondary,
            thickness: 3,
          ),
          Text(
            AppLocalizations.of(context)!.suraNames,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Divider(
            color: provider.themeMode==ThemeMode.light?
            Theme.of(context).primaryColor:Theme.of(context).colorScheme.secondary,
            thickness: 3,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: provider.themeMode==ThemeMode.light?
                Theme.of(context).primaryColor:Theme.of(context).colorScheme.secondary,
                thickness: 1,
                endIndent: 35,
                indent: 35,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, SuraDetails.routName,
                        arguments: SuraDetailsArgs(suraNames[index], index)
                        //i send the data of name of sura
                        );
                  },
                  child: Center(
                    child: Text(
                      suraNames[index],
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            //color: Colors.black
                            fontSize: 18,
                          ),
                    ),
                  ),
                );
              },
              itemCount: suraNames.length,
            ),
          ),
        ],
      ),
    );
  }
}
