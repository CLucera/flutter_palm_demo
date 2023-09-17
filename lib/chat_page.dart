import 'package:flutter/material.dart';
import 'package:flutter_palm_api/palm_service.dart';

import 'chat_message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final _controller = TextEditingController()
    ..addListener(
      () => setState(() {}),
    );

  final _messages = <ChatMessage>[];
  bool _submitting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Palm Demo"),
        elevation: 5.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              reverse: true,
              padding: const EdgeInsetsDirectional.symmetric(vertical: 8.0),
              children: [
                if (_submitting)
                  Center(child: const CircularProgressIndicator()),
                ..._messages,
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    onSubmitted: _submitMessage,
                    enabled: !_submitting,
                  ),
                ),
              ),
              IconButton(
                onPressed: _controller.text.isEmpty || _submitting
                    ? null
                    : () {
                        _submitMessage(_controller.text);
                      },
                icon: const Icon(Icons.send),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _submitMessage(String message) async {
    if (message.isEmpty) {
      return;
    }
    setState(() {
      _submitting = true;
      _messages.insert(
        0,
        ChatMessage(message: message, fromUser: true),
      );
    });

    _controller.clear();

    final response = await PalmService.instance.generateMessage(message);
    setState(() {
      _messages.insert(
        0,
        ChatMessage(
          message: response ?? "An error occurred, please try again",
          fromUser: false,
        ),
      );
      _submitting = false;
    });
  }
}
