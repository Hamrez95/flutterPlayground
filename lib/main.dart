import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color surfaceColor = Color(0x0dffffff);
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
        textTheme: GoogleFonts.latoTextTheme(TextTheme(bodyMedium: TextStyle(fontSize: 15),
        bodySmall: TextStyle(fontSize: 12,color: Color.fromARGB(100, 255, 255, 255)),
        headlineLarge: TextStyle(fontWeight: FontWeight.bold))),
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        dividerColor: surfaceColor,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        actions: [
          Icon(CupertinoIcons.chat_bubble),
          SizedBox(width: 4),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: Icon(CupertinoIcons.ellipsis_vertical),
          )
        ],
      ),
      body: Column(
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
                    Text('Hamidreza Pakpour'),
                    Text('.Net & Flutter Developer'),
                    SizedBox(height: 6,),
                    Row(
                      children: [
                        Icon(CupertinoIcons.location,color: Theme.of(context).textTheme.bodySmall!.color, size:16,),
                        SizedBox(width: 4),
                        Text('Tehran, Iran',style: Theme.of(context).textTheme.bodySmall,),
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
        child: Text('A .NET and Flutter developer proficient in C# and Dart, dedicated to creating user-friendly and scalable applications. With experience in designing and implementing web and mobile software solutions, they provide innovative and optimized approaches to meet business needs. Additionally, they are passionate about continuous learning and staying updated with the latest technologies.',
        style: Theme.of(context).textTheme.bodySmall),
      ),
      Divider(indent: 10,endIndent: 10,), 
      Padding(
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Skills',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold ),),
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
            title: 'PhotpShop',
            shadowColor: Colors.blue,
            isActive: _skill==_SkillType.photoshop,
            type: _SkillType.photoshop,
            onTap: () { 
              updateSelectedSkill(_SkillType.photoshop);
             },
            ),
            Skill(imagePath:'assets/images/app_icon_02.png' ,
            title: 'LightRoom',
            shadowColor: Colors.blueAccent,
            isActive: _skill==_SkillType.lightRoom, 
            type: _SkillType.lightRoom, 
            onTap: () { 
              updateSelectedSkill(_SkillType.lightRoom);
             },
            ),
            Skill(imagePath:'assets/images/app_icon_03.png' ,
            title: 'AfterEffect',
            shadowColor: Colors.deepPurple,
            isActive: _skill==_SkillType.afterEffect, 
            type: _SkillType.afterEffect, 
            onTap: () { 
               updateSelectedSkill(_SkillType.afterEffect);
             },
            ),
            Skill(imagePath:'assets/images/app_icon_04.png' ,
            title: 'Illastrator',
            shadowColor: Colors.orange,
            isActive: _skill==_SkillType.illastrator, 
            type: _SkillType.illastrator, 
            onTap: () {
              updateSelectedSkill(_SkillType.illastrator);

            },
            ),
            Skill(imagePath:'assets/images/app_icon_05.png' ,
            title: 'AdobeXD',
            shadowColor: Colors.pink,
            isActive: _skill==_SkillType.xd, 
            type: _SkillType.xd, 
            onTap: () {
              updateSelectedSkill(_SkillType.xd);

            },
            ),
          ],),
        )
        ],
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
