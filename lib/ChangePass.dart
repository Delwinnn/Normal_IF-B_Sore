import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
        centerTitle: true,  backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _oldPasswordController,
              decoration: InputDecoration(
                labelText: 'Enter old password: ',
                errorText: _errorMessage,
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _newPasswordController,
              decoration: InputDecoration(
                labelText: 'Enter new password: ',
                errorText: _errorMessage,
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
          ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue, 
    foregroundColor: Colors.white,
  ),
  onPressed: () {
    String oldPassword = _oldPasswordController.text;
    String newPassword = _newPasswordController.text;

    if (oldPassword.isEmpty && newPassword.isEmpty) {
      // Show dialog for both fields empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Both fields cannot be empty'),
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
    } else if (oldPassword.isEmpty) {
      // Show dialog for old password field empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Old password field can\'t be empty'),
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
    } else if (newPassword.isEmpty) {
      // Show dialog for new password field empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('New password field can\'t be empty'),
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
      // Proceed with password change logic
      String? currentUser = Provider.of<ProviderGudang>(context, listen: false).Gudang.usinguser;
      int index = Provider.of<ProviderGudang>(context, listen: false).Gudang.user[0].indexOf(currentUser);
      String? storedPassword = Provider.of<ProviderGudang>(context, listen: false).Gudang.user[1][index]; 

      if (currentUser != "") {
        if (oldPassword == storedPassword) {
          if (oldPassword == newPassword) {
            // Show dialog for old password equals new password
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text('Old password is equal to the new password'),
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
            Provider.of<ProviderGudang>(context, listen: false).updatePassword(currentUser, oldPassword, newPassword);
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Success'),
                  content: Text('Password changed successfully'),
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
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('Old password is incorrect'),
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
        print('No user logged in!');
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