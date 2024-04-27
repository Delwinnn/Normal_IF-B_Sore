import 'package:agile_git/RegisterPage.dart';
import 'package:agile_git/homePage.dart';
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
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 110),
              Icon(
                Icons.catching_pokemon,
                color: Colors.black,
                size: 120,
              ),
              SizedBox(height: 30),
              Text(
                "Login Account",
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
                    prefixIcon: Icon(Icons.person,color: Colors.black,),
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
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible=!isVisible;
                        });
                      },
                      icon: isVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                    ),
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
                    errorText: isCocok ? null : "Wrong Password",
                    labelStyle: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Provider.of<ProviderGudang>(context,listen: false).Gudang.usinguser = "OWNER";
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeView(data: Provider.of<ProviderGudang>(context).Gudang, fitur: listfitur, user: Provider.of<ProviderGudang>(context).Gudang.usinguser))
                  );
                }, 
                child: Text("Log In", style: TextStyle(fontSize: 15),),
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
                  Text("Create New Account?"),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegistrationView()),
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
    );
  }
}