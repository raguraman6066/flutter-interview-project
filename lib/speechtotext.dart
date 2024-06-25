import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound/flutter_sound.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late FlutterSoundRecorder _audioRecorder;
  bool _isRecording = false;
  late String _recordedFilePath;

  @override
  void initState() {
    super.initState();
    _audioRecorder = FlutterSoundRecorder();
  }

  Future<void> _startRecording() async {
    if (await Permission.microphone.request().isGranted) {
      setState(() {
        _isRecording = true;
      });
      _recordedFilePath = 'voice_message.aac';
      await _audioRecorder.startRecorder(
          toFile: _recordedFilePath, codec: Codec.aacMP4);
    }
  }

  Future<void> _stopRecording() async {
    await _audioRecorder.stopRecorder();
    setState(() {
      _isRecording = false;
    });
  }

  void _sendMessage(String message) {
    // Implement sending text message
    print('Sending message: $message');
  }

  void _sendVoiceMessage(String path) {
    // Implement sending voice message
    print('Sending voice message: $path');
    // Now you can send the recorded audio file path (path) to wherever you want.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Example message count
              itemBuilder: (context, index) {
                // Implement message item UI
                return ListTile(
                  title: Text('Message $index'),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Type a message'),
                    onSubmitted: _sendMessage,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _sendMessage('Text message');
                  },
                ),
                IconButton(
                  icon: Icon(_isRecording ? Icons.stop : Icons.mic),
                  onPressed: () {
                    if (_isRecording) {
                      _stopRecording().then((_) {
                        _sendVoiceMessage(_recordedFilePath);
                      });
                    } else {
                      _startRecording();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _audioRecorder = FlutterSoundRecorder();
  }
}
