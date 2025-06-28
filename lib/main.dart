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
      title: 'Profile Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
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
          Icon(CupertinoIcons.ellipsis_vertical)
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hamidreza Pakpour'),
                  Text('.Net & Flutter Developer'),
                  Row(
                    children: [
                      Icon(CupertinoIcons.location),
                      Text('Tehran, Iran'),
                    ],
                  ),
                ],
              ),
              Icon(CupertinoIcons.heart)
            ],
          ),
        ],
      ),
    );
  }
}
