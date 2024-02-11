import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'chatbot_ui.dart';

class UploadDocumentPage extends StatefulWidget {
  @override
  _UploadDocumentPageState createState() => _UploadDocumentPageState();
}

class _UploadDocumentPageState extends State<UploadDocumentPage> {
  File? _document;

  Future<void> _uploadDocument() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _document = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _navigateToChatbot() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatbotUI()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Document'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _document == null
                ? Text('No document selected.')
                : Image.file(_document!),
            ElevatedButton(
              onPressed: _uploadDocument,
              child: Text('Upload Document'),
            ),
            ElevatedButton(
              // onPressed: _navigateToChatbot,
              onPressed: MyApp(),
              child: Text('Continue to Chatbot'),
            ),
          ],
        ),
      ),
    );
  }
}
