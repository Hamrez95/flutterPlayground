import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
        textTheme: GoogleFonts.
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
                    Row(
                      children: [
                        Icon(CupertinoIcons.location),
                        SizedBox(width: 4),
                        Text('Tehran, Iran'),
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
        child: Text('A .NET and Flutter developer proficient in C# and Dart, dedicated to creating user-friendly and scalable applications. With experience in designing and implementing web and mobile software solutions, they provide innovative and optimized approaches to meet business needs. Additionally, they are passionate about continuous learning and staying updated with the latest technologies.'),
      ) 
        ],
      ),
    );
  }
}
