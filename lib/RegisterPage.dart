import 'package:agile_git/LoginPage.dart';
import 'package:agile_git/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationView extends StatefulWidget {
  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController kunci = TextEditingController();
  TextEditingController confirm = TextEditingController();
  bool isKey = true;
   bool isPassMatch = true;
  bool isPass = true;
  bool isSame = false;
  bool isPassMax = false;
  bool isUserMax = false;
  bool isVisible = false;
  bool isVisibleC = false;

  @override
  Widget build(BuildContext context) {
    Company data = Provider.of<ProviderGudang>(context).Gudang;
   return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 100),
                SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Text(
                      "Let's sign you up. ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: user,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: "Username",
                      errorText: isUserMax
                          ? "Username Max 10 Characters"
                          : (isSame ? "Username Registered" : null),
                      labelStyle: TextStyle(color: Colors.grey[700]),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value.length > 10) {
                          isUserMax = true;
                        } else {
                          isUserMax = false;
                        }
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    obscureText: !isVisible,
                    controller: pass,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: isVisible
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      errorText:
                          isPassMax ? "Password Max 10 Characters" : null,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.grey[700]),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value.length > 10) {
                          isPassMax = true;
                        } else {
                          isPassMax = false;
                        }
                        // Check if password and confirm password match
                        if (value != confirm.text) {
                          isPassMatch = false;
                        } else {
                          isPassMatch = true;
                        }
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    obscureText: !isVisibleC,
                    controller: confirm,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisibleC = !isVisibleC;
                          });
                        },
                        icon: isVisibleC
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: "Confirm Password",
                      errorText: isPassMatch ? null : "Passwords do not match",
                      labelStyle: TextStyle(color: Colors.grey[700]),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value != pass.text) {
                          isPassMatch = false;
                        } else {
                          isPassMatch = true;
                        }
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    obscureText: true,
                    controller: kunci,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: "Access Key",
                      errorText: isKey ? null : "Invalid Key",
                      labelStyle: TextStyle(color: Colors.grey[700]),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: (!isUserMax && !isPassMax && isPassMatch) &&
                          (user.text.trim() != "" &&
                              pass.text != "" &&
                              confirm.text != "" &&
                              kunci.text != "")
                      ? () {
                          if (kunci.text == data.key) {
                            setState(() {
                              if (data.user[0]
                                  .contains(user.text.toUpperCase())) {
                                isSame = true;
                                isKey = true;
                              } else {
                                isKey = true;
                                isSame = false;
                                Provider.of<ProviderGudang>(context,listen: false).addAccount(user.text.toUpperCase(), pass.text, "https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg", [false,false,false,false,false]);
                                user.clear();
                                pass.clear();
                                kunci.clear();
                                confirm.clear();
                                Navigator.of(context).pop();
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Success"),
                                      content:
                                          Text("Your Account Registered..."),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "Okay",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            });
                          } else {
                            setState(() {
                              isKey = false;
                              user.clear();
                              pass.clear();
                              kunci.clear();
                              confirm.clear();
                            });
                          }
                        }
                      : null,
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      elevation: 7,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.8,
                        50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an Account?"),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginView(),
                          ),
                        );
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
