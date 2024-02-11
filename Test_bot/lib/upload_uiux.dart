import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _file; // Use nullable type for file
  String _fileName = ''; // Provide initial value for file name
  List<String> _uploadedFileNames = [];

  // Pick a file using file_picker package
  Future pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Check if the widget is still mounted before calling setState
      if (mounted) {
        setState(() {
          _file =
              File(result.files.single.path ?? ''); // Use null check for path
          _fileName = result.files.single.name ?? ''; // Use null check for name
          _uploadedFileNames
              .add(_fileName); // Add uploaded file name to the list
        });
      }
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Upload your documents',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  await pickFile();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.upload,
                        size: 50,
                        color: Colors.purple,
                      ),
                      Center(
                        child: Text(
                          'Upload Your Files Here',
                          style:
                              TextStyle(color: Colors.purple, fontSize: 20.0),
                        ),
                      ),
                      if (_fileName.isNotEmpty)
                        Text(
                          'Uploaded File: $_fileName',
                          style: TextStyle(fontSize: 16),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: _fileName.isNotEmpty
                      ? () {
                          // Perform the upload functionality here
                          print('Uploading file: $_fileName');
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    primary:
                        _fileName.isNotEmpty ? Colors.purple : Colors.white,
                  ),
                  child: Text('Let\'s Go for Chat !'),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _uploadedFileNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    final fileName = _uploadedFileNames[index];
                    return ListTile(
                      title: Text(fileName),
                      trailing: Icon(Icons.check_circle, color: Colors.green),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
