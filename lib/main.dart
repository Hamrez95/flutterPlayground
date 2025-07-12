import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;
  @override
  Widget build(BuildContext context) {
    Color surfaceColor = Color(0x0dffffff);
    Color primaryColor = Colors.pink.shade400;
    Locale _locale = Locale('en');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Demo',
      localizationsDelegates: [
        AppLocalizations.delegate, // اضافه کردن این خط
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('fa'), // Persian
      ],
      locale: _locale,
      theme: _themeMode == ThemeMode.dark ?
      MyAppThemeConfig.dark().getTheme(_locale.languageCode)
      : MyAppThemeConfig.light().getTheme(_locale.languageCode),
      home: MyHomePage(toggleThemeMode: (){
        setState(() {
          if (_themeMode == ThemeMode.dark)
          _themeMode = ThemeMode.light;
          else
          _themeMode = ThemeMode.dark;

        });
      },),
    );
  }
}


class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;

  const MyHomePage({super.key, required this.toggleThemeMode});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
enum _SkillType{
photoshop,xd,illastrator,afterEffect,lightRoom;
}

class _MyHomePageState extends State<MyHomePage> {
  _SkillType _skill = _SkillType.photoshop;

  void updateSelectedSkill(_SkillType skillType){
    setState(() {
        this._skill =skillType;
    });
  }
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!; // گرفتن دیکشنری

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.profilePageTitle), // استفاده از کلید
        actions: [
          InkWell(
            onTap: widget.toggleThemeMode,
            child: Icon(CupertinoIcons.sunrise)),
          SizedBox(width: 8,),
          Icon(CupertinoIcons.chat_bubble),
          SizedBox(width: 4),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: Icon(CupertinoIcons.ellipsis_vertical),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset('assets/images/profile_image.png',
                          width: 60, height: 60)),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(localizations.developerName), // استفاده از کلید
                      Text(localizations.netFlutterDeveloper), // استفاده از کلید
                      SizedBox(height: 6,),
                      Row(
                        children: [
                          Icon(CupertinoIcons.location,color: Theme.of(context).textTheme.bodySmall!.color, size:16,),
                          SizedBox(width: 4),
                          Text(localizations.locationTehranIran,style: Theme.of(context).textTheme.bodySmall,), // استفاده از کلید
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(CupertinoIcons.heart , color: Colors.pinkAccent,),
                )
              ],
            ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(localizations.profileDescription, // استفاده از کلید
          style: Theme.of(context).textTheme.bodySmall),
        ),
        Divider(indent: 10,endIndent: 10,),
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(localizations.skillsTitle,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold ),), // استفاده از کلید
              SizedBox(width: 4,),
              Icon(CupertinoIcons.chevron_down,size: 12,),
            ],
          ),
        ),
          SizedBox(height: 12,),
          Center(
            child: Wrap(direction: Axis.horizontal,
            spacing: 8,
            runSpacing: 8,
            children: [
              Skill(imagePath:'assets/images/app_icon_01.png' ,
              title: localizations.skillPhotoshop, // استفاده از کلید
              shadowColor: Colors.blue,
              isActive: _skill==_SkillType.photoshop,
              type: _SkillType.photoshop,
              onTap: () {
                updateSelectedSkill(_SkillType.photoshop);
               },
              ),
              Skill(imagePath:'assets/images/app_icon_02.png' ,
              title: localizations.skillLightRoom, // استفاده از کلید
              shadowColor: Colors.blueAccent,
              isActive: _skill==_SkillType.lightRoom,
              type: _SkillType.lightRoom,
              onTap: () {
                updateSelectedSkill(_SkillType.lightRoom);
               },
              ),
              Skill(imagePath:'assets/images/app_icon_03.png' ,
              title: localizations.skillAfterEffect, // استفاده از کلید
              shadowColor: Colors.deepPurple,
              isActive: _skill==_SkillType.afterEffect,
              type: _SkillType.afterEffect,
              onTap: () {
                 updateSelectedSkill(_SkillType.afterEffect);
               },
              ),
              Skill(imagePath:'assets/images/app_icon_04.png' ,
              title: localizations.skillIllustrator, // استفاده از کلید
              shadowColor: Colors.orange,
              isActive: _skill==_SkillType.illastrator,
              type: _SkillType.illastrator,
              onTap: () {
                updateSelectedSkill(_SkillType.illastrator);

              },
              ),
              Skill(imagePath:'assets/images/app_icon_05.png' ,
              title: localizations.skillAdobeXD, // استفاده از کلید
              shadowColor: Colors.pink,
              isActive: _skill==_SkillType.xd,
              type: _SkillType.xd,
              onTap: () {
                updateSelectedSkill(_SkillType.xd);

              },
              ),
            ],),
          ),
            Divider(indent: 10,endIndent: 10,),
            Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(localizations.personalInformationTitle, // استفاده از کلید
                  style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold ),),
                  SizedBox(width: 4,),
                  Icon(CupertinoIcons.chevron_down,size: 12,),
                ],
              ),
              SizedBox(height: 12,),
                  TextField(
                    decoration: InputDecoration(
                      labelText: localizations.emailLabel, // استفاده از کلید
                      prefixIcon: Icon(CupertinoIcons.at)
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextField(
                    decoration: InputDecoration(
                      labelText: localizations.passwordLabel, // استفاده از کلید
                      prefixIcon: Icon(CupertinoIcons.lock)
                    ),
                  ),
                    SizedBox(height: 12,),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text(localizations.saveButton), // استفاده از کلید
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    )),
                    ),
            ],
          ),
        ),
          ],
        ),
      ),
    );
  }
}

class Skill extends StatelessWidget {
  final _SkillType type;
  final String title;
  final String imagePath;
  final bool isActive;
  final Color shadowColor;
  final Function() onTap;
  const Skill({
    super.key, required this.title, required this.imagePath, required this.isActive, required this.shadowColor, required this.type, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
  final BorderRadius defaltBorderRadius = BorderRadius.circular(8);

    return InkWell(
      borderRadius: defaltBorderRadius,
      onTap: onTap,
      child: Container(
        width: 120,
        height: 100,
        decoration: isActive?
        BoxDecoration(
          color: Theme.of(context).dividerColor,
          borderRadius:BorderRadius.circular(8)): null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration:isActive? BoxDecoration(
                boxShadow: [
                  BoxShadow(color: shadowColor.withValues(alpha: 0.5),blurRadius: 10,)
                  ]
              ): null,
              child: Image.asset(imagePath,width: 40,height: 40,)),
            SizedBox(height: 8,),
            Text(title)
          ],
        ),
      ),
    );
  }
}

class MyAppThemeConfig{
  final Color primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;
  static const String faPrimaryFontFamily = 'IranYekan';

MyAppThemeConfig.dark():primaryTextColor = Colors.white,
secondryTextColor = Colors.white70,
surfaceColor = Color(0x0dffffff),
backgroundColor = Color.fromARGB(255, 30, 30, 30),
appBarColor = Colors.black,
brightness = Brightness.dark;

MyAppThemeConfig.light():primaryTextColor = Colors.grey.shade900,
secondryTextColor = Colors.grey.shade900,
surfaceColor = Color(0x0d000000),
backgroundColor = Colors.white,
appBarColor = Color.fromARGB(255, 184, 184, 184),
brightness = Brightness.light;

ThemeData getTheme(String languageCode){
  return ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide.none),
          filled: true,
          fillColor: surfaceColor
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(primaryColor))
          ),
        primarySwatch: Colors.pink,
        primaryColor: primaryColor,
        brightness: brightness,
        scaffoldBackgroundColor: backgroundColor,
        textTheme: languageCode == 'fa'?  faPrimaryTestTheme : enPrimaryTestTheme,
        appBarTheme: AppBarTheme(backgroundColor: appBarColor),
        dividerColor: surfaceColor,
      );
}

TextTheme get enPrimaryTestTheme => GoogleFonts.latoTextTheme(
          TextTheme(
            bodyMedium: TextStyle(fontSize: 15, color: primaryTextColor),
            bodySmall: TextStyle(fontSize: 12,color: secondryTextColor),
            headlineLarge: TextStyle(fontWeight: FontWeight.bold,color: primaryTextColor)));

TextTheme get faPrimaryTestTheme => TextTheme(
            bodyMedium: TextStyle(fontSize: 15, color: primaryTextColor,fontFamily: faPrimaryFontFamily),
            bodySmall: TextStyle(fontSize: 12,color: secondryTextColor,fontFamily: faPrimaryFontFamily),
            headlineLarge: TextStyle(fontWeight: FontWeight.bold,color: primaryTextColor,fontFamily: faPrimaryFontFamily));
}

