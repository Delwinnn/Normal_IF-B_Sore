import 'package:agile_git/LoginPage.dart';
import 'package:flutter/material.dart';

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
  bool isPass = true;
  bool isSame = false;
  bool isPassMax = false;
  bool isUserMax = false;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              Icon(
                Icons.catching_pokemon,
                color: Colors.black,
                size: 120,
              ),
              SizedBox(height: 30),
              Text(
                "Register Account",
                style: TextStyle(
                  color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: user,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Username",
                    errorText: isUserMax ? "Username Max 10 Characters" : (isSame ? "Username Registered" : null),
                    labelStyle: TextStyle(color: Colors.grey[700]),
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (value.length>10) {
                        isUserMax = true;
                      }
                      else{
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
                      icon: isVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                    ),
                    errorText: isPassMax ? "Password Max 10 Characters" : null,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.grey[700]),
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (value.length>10) {
                        isPassMax = true;
                      }
                      else{
                        isPassMax = false;
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
                  controller: confirm,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_open_outlined),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Confirm Password",
                    errorText: isPass ? null : "Unmatched Password",
                    labelStyle: TextStyle(color: Colors.grey[700]),
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (value!=pass.text) {
                        isPass = false;
                      }
                      else{
                        isPass = true;
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
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Access Key",
                    errorText: isKey ? null : "Invalid Key",
                    labelStyle: TextStyle(color: Colors.grey[700]),
                  ),
                  onChanged: (value) {
                    setState(() {
                      
                    });
                  },
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {

                },
                child: Text("Register", style: TextStyle(fontSize: 15),),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  elevation: 7,
                  fixedSize: Size.fromWidth(150),
                  padding:EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  )
                ),
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
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}