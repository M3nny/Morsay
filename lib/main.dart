// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flashlight/flashlight.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

void main() => runApp(Human2Morse());

String latin = "";
String actualMorse = "";
List<String> alphabet = [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z",
  " ",
  "\n"
];
List<String> morseList = [
  ".-",
  "-...",
  "-.-.",
  "-..",
  ".",
  "..-.",
  "--.",
  "....",
  "..",
  ".---",
  "-.-",
  ".-..",
  "--",
  "-.",
  "---",
  ".--.",
  "--.-",
  ".-.",
  "...",
  "-",
  "..-",
  "...-",
  ".--",
  "-..-",
  "-.--",
  "--..",
  "/",
  "\n"
];

int dot = 200;
int dash = dot * 3;
int simbol = dot; //space between dot or dash
int letter = dash; //space between letters
int word = dot * 7; //space between words

// ignore: must_be_immutable
class Human2Morse extends StatelessWidget {
  const Human2Morse({Key key}) : super(key: key);

  void mediaTranslation(String type) {
    final pattern = <int>[];
    String tempMorse = "%" + actualMorse + "%";
    // building the pattern
    for (int i = 1; i < tempMorse.length - 1; i++) {
      switch (tempMorse[i]) {
        case ".":
          {
            pattern.add(dot);
            if (tempMorse[i + 1] != " ") {
              pattern.add(simbol);
            }
          }
          break;

        case "-":
          {
            pattern.add(dash);
            if (tempMorse[i + 1] != " ") {
              pattern.add(simbol);
            }
          }
          break;

        case "/":
          {
            pattern.add(word);
          }
          break;

        case " ":
          {
            if (tempMorse[i + 1] != "/" && tempMorse[i - 1] != "/") {
              pattern.add(letter);
            }
          }
          break;

        default:
          {
            pattern.add(word);
          }
          break;
      }
    }

    if (pattern.isNotEmpty) {
      if (type == "vibration") {
        Vibration.vibrate(pattern: pattern);
      } else if (type == "flash") {
        morseToTorchligth(pattern);
      }
    }
  }

  void morseToTorchligth(pattern) {
    for (int i = 0; i < pattern.length; i++) {
      if (i % 2 == 0) {
        sleep(Duration(milliseconds: pattern[i]));
      } else {
        Flashlight.lightOn();
        sleep(Duration(milliseconds: pattern[i]));
        Flashlight.lightOff();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xff1E1E2E)),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Translator(),
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 170),
                      width: 80,
                      height: 80,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff575268)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          elevation: MaterialStateProperty.all<double>(0),
                        ),
                        onPressed: () => mediaTranslation("flash"),
                        child: SizedBox(
                          width: 380,
                          child: SvgPicture.asset(
                            "assets/images/torch.svg",
                            width: 100,
                            height: 100,
                            color: Color(0xffC9CBFF),
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
                      margin: EdgeInsets.only(top: 170),
                      width: 80,
                      height: 80,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff575268)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          elevation: MaterialStateProperty.all<double>(0),
                        ),
                        onPressed: () => mediaTranslation("vibration"),
                        child: SizedBox(
                          width: 380,
                          child: SvgPicture.asset(
                            "assets/images/vibration.svg",
                            width: 100,
                            height: 100,
                            color: Color(0xffC9CBFF),
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
                      margin: EdgeInsets.only(top: 170),
                      width: 80,
                      height: 80,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff575268)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          elevation: MaterialStateProperty.all<double>(0),
                        ),
                        onPressed: () {},
                        child: SizedBox(
                          width: 380,
                          child: SvgPicture.asset(
                            "assets/images/sound.svg",
                            width: 100,
                            height: 100,
                            color: Color(0xffC9CBFF),
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

class Translator extends StatefulWidget {
  const Translator({Key key}) : super(key: key);

  @override
  State<Translator> createState() => _TranslatorState();
}

class _TranslatorState extends State<Translator> {
  // every time the text changes update the variable and call the method to update the morse textField
  void updateText(String newText) {
    latin = newText;
    updateMorse();
  }

  void updateMorse() {
    setState(() {
      actualMorse = latinToMorse(latin);
    });
  }

  String latinToMorse(String latin) {
    String result = "";

    for (int i = 0; i < latin.length; i++) {
      for (int j = 0; j < alphabet.length; j++) {
        if (latin[i].toUpperCase() == alphabet[j]) {
          result = result + " " + morseList[j];
        }
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Column(children: [
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(top: 50),
          width: 380,
          child: TextField(
            cursorColor: Color(0xffD9E0EE),
            maxLines: 5,
            style: TextStyle(color: Color(0xffD9E0EE)),
            onChanged: updateText,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xff302D41))),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xffD9E0EE), width: 2.0),
              ),

              //hintText: "translate from human",
              fillColor: Color(0xff302D41),
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
            color: Color(0xffF5E0DC),
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(top: 50),
          width: 380,
          child: TextField(
            maxLines: 5,
            style: TextStyle(color: Color(0xffD9E0EE)),
            readOnly: true,
            controller: TextEditingController(text: actualMorse),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xff302D41))),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xffD9E0EE), width: 2.0),
              ),

              //hintText: "translate from human",
              fillColor: Color(0xff302D41),
              filled: true,

              suffixIcon: Container(
                margin: EdgeInsets.only(right: 10, top: 80),
                width: 50,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff575268)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    elevation: MaterialStateProperty.all<double>(0),
                  ),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: actualMorse));
                  },
                  child: SvgPicture.asset(
                    "assets/images/copy.svg",
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
