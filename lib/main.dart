// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flashlight/flashlight.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(Human2Morse());

String latin = "";
List<String> alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "l", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", " "];
List<String> morseList = [".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--..", "/"];

// ignore: must_be_immutable
class Human2Morse extends StatelessWidget {
  const Human2Morse({Key key}) : super(key: key);

  void updateText(String newText){
    latin = newText;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 50),
                width: 380,
                child: TextField(
                  maxLines: 5,
                  onChanged: updateText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    //hintText: "translate from human",
                    fillColor: Color(0xffD8D8D8),
                    filled: true,
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 30),
                width: 380,
                child: SvgPicture.asset(
                  "assets/images/swap.svg",
                  width: 100,
                  height: 100,
                  color: Color(0xff969696),
                ),
              ),
            ),

            MorseField(),

            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 150),
                      width: 80,
                      height: 80,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey[300]),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: SizedBox(
                          width: 380,
                          child: SvgPicture.asset(
                            "assets/images/torch.svg",
                            width: 100,
                            height: 100,
                            color: Color(0xff797979),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 150),
                      width: 80,
                      height: 80,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey[300]),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: SizedBox(
                          width: 380,
                          child: SvgPicture.asset(
                            "assets/images/vibration.svg",
                            width: 100,
                            height: 100,
                            color: Color(0xff797979),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 150),
                      width: 80,
                      height: 80,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey[300]),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: SizedBox(
                          width: 380,
                          child: SvgPicture.asset(
                            "assets/images/sound.svg",
                            width: 100,
                            height: 100,
                            color: Color(0xff797979),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MorseField extends StatefulWidget {
  const MorseField({Key key }) : super(key: key);

  @override
  State<MorseField> createState() => _MorseFieldState();
}
class _MorseFieldState extends State<MorseField> {

  String actualMorse = "";
  void updateMorse(){
    setState((){
      actualMorse = latinToMorse(latin);
    });
  }

String latinToMorse(String latin){
  String result = "";

  for(int i = 0; i < latin.length; i++){
        for(int j = 0; j < alphabet.length; j++){
            if(latin[i].toUpperCase() == alphabet[j]){
                result = result + " " + morseList[j];
            }
        }
    }
    return result;
}

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: 50),
        width: 380,
        child: TextField(
          maxLines: 5,
          onTap: updateMorse,
          readOnly: true,
          controller: TextEditingController(text: actualMorse),
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)),
            //hintText: "translate from human",
            fillColor: Color(0xffD8D8D8),
            filled: true,
          ),
        ),
      ),
    );
  }
}