import 'package:flutter/material.dart';

class ChangePicturePage extends StatefulWidget {
  final void Function(String) onUpdateImageUrl;

  const ChangePicturePage({Key? key, required this.onUpdateImageUrl}) : super(key: key);

  @override
  _ChangePicturePageState createState() => _ChangePicturePageState();
}

class _ChangePicturePageState extends State<ChangePicturePage> {
  TextEditingController _textFieldController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Profile Picture"),
        centerTitle: true,  backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                labelText: 'Enter link for new profile image: ',
                errorText: _errorMessage,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
               style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue, 
    foregroundColor: Colors.white,
  ),
              onPressed: () {
                String newImageUrl = _textFieldController.text;
                if (_isValidUrl(newImageUrl)) {
                  widget.onUpdateImageUrl(newImageUrl);
                  Navigator.pop(context);
                  // Show success dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Success'),
                        content: Text('Profile picture updated successfully'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  setState(() {
                    _errorMessage = 'Please enter a valid URL';
                  });
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please enter a valid URL'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }

  bool _isValidUrl(String url) {
    Uri? uri = Uri.tryParse(url);
    return uri != null && uri.isAbsolute && (uri.scheme == 'http' || uri.scheme == 'https');
  }
}