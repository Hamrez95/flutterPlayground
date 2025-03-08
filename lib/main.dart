import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // This removes the debug banner
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
              child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('images/hamidProfile.jpg'),
                radius: 50,
              ),
              Text(
                  'Hamidreza Pakpour',
              style:TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40,
                fontWeight:FontWeight.w400,
                color: Colors.white
              ) ,
              ),
              SizedBox(height: 5,),
              Text(
                'DEVELOPER',
                style:TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 10,
                    letterSpacing: 2.5,
                    color: Colors.teal.shade100
                ) ,
              ),




            ],
          ),
          ),
        ),
      );
  }
}

