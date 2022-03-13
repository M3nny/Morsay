import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flashlight/flashlight.dart';

void main() => runApp(const Human2Morse());

class Human2Morse extends StatelessWidget {
  const Human2Morse({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Human to morse'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    child: const Text('Vibrate'),
                    onPressed: () {
                      Vibration.vibrate();
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Dot'),
                    onPressed: () {
                      final player = AudioCache();
                      player.play('audio/dot.mp3');
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Dash'),
                    onPressed: () {
                      final player = AudioCache();
                      player.play('audio/dash.mp3');
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Torch on'),
                    onPressed: () {
                      Flashlight.lightOn();
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Torch off'),
                    onPressed: () {
                      Flashlight.lightOff();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
