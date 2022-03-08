import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';
import 'dart:developer';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Human to Morse';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Translate',
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary:  const Color.fromRGBO(255, 160, 51, 1),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold)
            ),
            onPressed: () async {_enableTorch(context);},
            child: const Text('Torch'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary:  const Color.fromRGBO(203, 96, 204, 1),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold)
            ),
            onPressed: () {},
            child: const Text('Vibration'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary:  const Color.fromRGBO(96, 254, 213, 1),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold)
            ),
            onPressed: () {},
            child: const Text('Signal'),
          ),
        ],
      ),
    );
  }
}

Future<void> _enableTorch(BuildContext context) async {
  try {
    await TorchLight.enableTorch();
  } on Exception catch (_) {
    log("error");
  }
}

