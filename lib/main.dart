import 'package:flutter/material.dart';
import 'package:flutter_palm_api/api_key.dart';
import 'package:flutter_palm_api/chat_page.dart';
import 'package:flutter_palm_api/palm_service.dart';

void main() {
  //TODO USE YOUR API KEY
  PalmService.init(API_KEY);
  runApp(const FlutterPalmApp());
}

class FlutterPalmApp extends StatelessWidget {
  const FlutterPalmApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palm Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChatPage(),
    );
  }
}
