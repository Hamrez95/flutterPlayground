import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false, // This removes the debug banner
        home: Scaffold(
          appBar: AppBar(
            title: Text('I Am Rich'),
            centerTitle: true,
            titleTextStyle: TextStyle(color: Colors.white),
            backgroundColor: const Color.fromARGB(255, 32, 32, 32),
          ),
          body:
             Image(
              image: AssetImage('images/rich.jpeg'),
               fit: BoxFit.cover, // This makes the image fill the body
               width: double.infinity, // Ensures it stretches fully
               height: double.infinity, // Ensures it stretches fully
          ),
          backgroundColor: const Color.fromARGB(255, 0, 44, 37),
        )),
  );
}
