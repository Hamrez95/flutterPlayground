import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}
class DicePage extends StatefulWidget {
  const DicePage({super.key});
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftButtonNumber = 3;
  var rightButtonNumber = 3;
void DiceFaceNumber (){
  setState(() {
    rightButtonNumber = Random().nextInt(6)+1;
    leftButtonNumber = Random().nextInt(6)+1;
  });
}
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
          children: <Widget> [
            Expanded(
              child : TextButton(
                onPressed: (){
                  DiceFaceNumber();
                  print('left button got pressed');
                },
                child: Image.asset('images/dice$leftButtonNumber.png'),
              ),
            ),
            Expanded(
              child : TextButton(
                onPressed: (){
                  DiceFaceNumber();
                  print('right button got pressed');
                },
                child: Image.asset('images/dice$rightButtonNumber.png'),
              ),
            )
          ]
      ),
    );
  }
}
