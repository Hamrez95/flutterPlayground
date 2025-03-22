import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  void playSound(int changeAudioNumber){
    final player = AudioPlayer();
    player.play(AssetSource('note$changeAudioNumber.wav'));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            Expanded(
              child: TextButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.green)),
              onPressed: () {
                playSound(1);
              },child: Text(''),),
            ),
            Expanded(
              child: TextButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.red)),
                onPressed: () {
                  playSound(2);
                },child: Text(''),),
            ),
            Expanded(
              child: TextButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.yellow)),
                onPressed: () {
                  playSound(3);
                },child: Text(''),),
            ),
            Expanded(
              child: TextButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.orange)),
                onPressed: () {
                  playSound(4);
                },child: Text(''),),
            ),
            Expanded(
              child: TextButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.pink)),
                onPressed: () {
                  playSound(5);
                },child: Text(''),),
            ),
            Expanded(
              child: TextButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue)),
                onPressed: () {
                  playSound(6);
                },child: Text(''),),
            ),
            Expanded(
              child: TextButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.brown)),
                onPressed: () {
                  playSound(7);
                },child: Text(''),),
            ),
          ],
          ),
          ),
        ),
      );

  }
}
