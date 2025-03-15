import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return
    runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(child: Text('What should you do?',style:TextStyle(fontFamily:'Permanent'),)),
        ),
        backgroundColor: Colors.teal,
        body: MagicTraders8Ball(),
    ),
    ),
  );
}
class MagicTraders8Ball extends StatefulWidget {
  const MagicTraders8Ball({super.key});

  @override
  State<MagicTraders8Ball> createState() => _MagicTraders8BallState();
}

class _MagicTraders8BallState extends State<MagicTraders8Ball> {
  var magicBallMessage = 1;
void BallImage (){
  setState(() {
    magicBallMessage = Random().nextInt(5)+1;
  });
}
  @override
  Widget build(BuildContext context) {
    return
      Center(
          child: TextButton(
              onPressed: (){
                BallImage();
          },
        child: Image.asset('images/ball$magicBallMessage.png'),
        ),
      );
  }
}
