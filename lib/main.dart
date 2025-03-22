import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  void playSound(int changeAudioNumber){
    final player = AudioPlayer();
    player.play(AssetSource('note$changeAudioNumber.wav'));
  }

  Expanded buildKey( Color color,int soundNumber){
    return Expanded(
      child: TextButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(color)),
        onPressed: () {
          playSound(soundNumber);
        },child: Text(''),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(Colors.red,1),
              buildKey(Colors.orange,2),
              buildKey(Colors.blue,3),
              buildKey(Colors.pink,4),
              buildKey(Colors.cyan,5),
              buildKey(Colors.red.shade400,6),
              buildKey(Colors.purple,7),
          ],
          ),
          ),
        ),
      );

  }
}
