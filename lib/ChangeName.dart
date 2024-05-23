import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

class ChangeUsernamePage extends StatefulWidget {
  @override
  _ChangeUsernamePageState createState() => _ChangeUsernamePageState();
}

class _ChangeUsernamePageState extends State<ChangeUsernamePage> {
  TextEditingController _usernameController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Username"),
        centerTitle: true,  backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Enter new username: ',
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
                String newUsername = _usernameController.text;
                if (newUsername.isNotEmpty) {
                  ProviderGudang provider = Provider.of<ProviderGudang>(context, listen: false);
                  String? currentUser = provider.Gudang.usinguser;
                  if (currentUser != "") {
                    if (provider.Gudang.user[0].contains(newUsername.toUpperCase())) {
                      setState(() {
                        _errorMessage = "Username has been used";
                      });
                    }
                    else{
                      provider.updateUsername(currentUser, newUsername.toUpperCase());
                      Navigator.pop(context);
                      // Show success dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Success'),
                            content: Text('Username updated successfully to ${newUsername.toUpperCase()}'),
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
                  } else {
                    // Show "No user logged in" dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('No user logged in!'),
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
                } else {
                  setState(() {
                    _errorMessage = 'Username cannot be empty';
                  });
                  // Show "Username cannot be empty" dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Username cannot be empty'),
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
}