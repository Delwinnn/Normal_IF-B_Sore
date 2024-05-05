
import 'package:flutter/material.dart';

class CardAccount extends StatefulWidget {
  final String acc;
  final String pwd;
  final String pics;
  const CardAccount({super.key, required this.acc,  required this.pwd, required this.pics});

  @override
  State<CardAccount> createState() => _CardAccountState();
}

class _CardAccountState extends State<CardAccount> {
  bool _seePass = false;
  @override
  Widget build(BuildContext context) {
  final TextEditingController password = TextEditingController(text : widget.pwd);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: EdgeInsetsDirectional.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children:[ 
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage("${widget.pics}"), 
              ),
              SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.acc}",style: TextStyle(fontSize: 16),),
                  SizedBox(height: 10,),
                  Container(
                    width: 160,
                    height: 30,
                    child: TextField(
                      obscureText: !_seePass,
                      controller: password,
                      enabled: false,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none, 
                      ),
                    ),
                  ),
                ],
              ),
            ]
          ),
          Row(
            children: [
              Container(
                height: 75,
                width: 1,
                decoration: BoxDecoration(
                  color: Colors.grey
                ),
              ),
              SizedBox(width: 7,),
              Column(
                children: [
                  Text("Password"),
                  Switch(
                    value: _seePass,
                    onChanged: (value) {
                      setState(() {
                        _seePass = value;
                      });
                    },
                  ),
                ],
              ),
            ]
          ),
        ],
      ),
    );
  }
}