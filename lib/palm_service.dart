import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PalmService {
  PalmService._(this.apiKey);
  final String apiKey;

  static PalmService? _instance;

  static init(String apiKey) {
    if (_instance != null) {
      throw FlutterError("Already inited!");
    }
    _instance = PalmService._(apiKey);
  }

  static PalmService get instance {
    if (_instance != null) {
      return _instance!;
    }
    throw StateError(
      "Palm services must be inited! call PalmService.init(String apiKey) before use",
    );
  }

  Future<String?> generateMessage(String prompt) async {
    final result = await http.post(
      Uri.parse(
          " https://generativelanguage.googleapis.com/v1beta2/models/text-bison-001:generateText?key=${apiKey}"),
      body: {
        "prompt": prompt,
      },
    );
    if (result.statusCode == 200) {
      return result.body;
    }
    return null;
  }
}