import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:ocr_kit/enums.dart';
import 'package:ocr_kit/ocr_kit.dart';
import 'package:ocr_kit/ocr_kit_controller.dart';
import 'package:ocr_kit/ocr_kit_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  OcrKitController ocrKitController = OcrKitController();
  final _ocrKitPlugin = OcrKit();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _ocrKitPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          children: [
            FloatingActionButton(onPressed: (){
              ocrKitController.changeFlashMode(OcrKitFlashMode.on);
            }),
            FloatingActionButton(onPressed: (){
              ocrKitController.changeFlashMode(OcrKitFlashMode.off);
            }),
          ],
        ),
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body:OcrKitView(
            controller: ocrKitController,
            onTextRead: (c){
          print(c.text);
        })
      ),
    );
  }
}
