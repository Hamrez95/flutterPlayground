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
              SizedBox(height: 10,),
              Text(
                'DEVELOPER',
                style:TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 10,
                    letterSpacing: 2.5,
                    color: Colors.teal.shade100
                ) ,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
                  child: Row(
                    children: <Widget>[
                      Icon(
                          Icons.phone,
                      color: Colors.teal.shade900,),
                      SizedBox(width: 5),
                      Text(
                        '09195515233',
                        style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.teal.shade900),),
                 ],
                ),
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 0,horizontal: 50),
                padding:EdgeInsets.symmetric(vertical: 10,horizontal: 20) ,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      color: Colors.teal.shade900,),
                    SizedBox(width: 5),
                    Text(
                      'Hamidrezapakpour95@gmail.com',
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.teal.shade900),),
                  ],
                ),
              )


            ],
          ),
          ),
        ),
      );
  }
}

