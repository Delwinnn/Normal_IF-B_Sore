import 'package:agile_git/FirstPage.dart';
import 'package:agile_git/RegisterPage.dart';
import 'package:agile_git/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool isCocok = true;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
  List account = Provider.of<ProviderGudang>(context).Gudang.user;
     return WillPopScope(
      onWillPop: () async {
        return Future.value(false); 
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 150),
                SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Text(
                      "Let's Sign you in.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Text(
                      "Welcome Back 🖐",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: user,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: "Username",
                      labelStyle: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: pass,
                    obscureText: !isVisible,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
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
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: "Password",
                      errorText: isCocok ? null : "Wrong Password",
                      labelStyle: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      int index = account[0].indexOf(user.text.toUpperCase());
                      if (index != -1) {
                        if (account[1][index] == pass.text) {
                          Provider.of<ProviderGudang>(context, listen: false)
                              .Gudang
                              .usinguser = account[0][index];
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FirstPage()));
                          ScaffoldMessenger.of(context).showSnackBar(PesanSnackBar("Login Successful",true));
                          user.clear();
                          pass.clear();
                        } else {
                          isCocok = false;
                          pass.clear();
                          ScaffoldMessenger.of(context).showSnackBar(PesanSnackBar("Login Failed!",false));
                        }
                      } else {
                        isCocok = false;
                        pass.clear();
                        ScaffoldMessenger.of(context).showSnackBar(PesanSnackBar("Login Failed!",false));
                      }
                    });
                  },
                  child: Text(
                    "Log In",
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
                    Text("Create New Account?"),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationView()),
                        );
                      },
                      child: Text(
                        "Register Now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
