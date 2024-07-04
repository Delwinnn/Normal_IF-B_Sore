
import 'package:agile_git/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CardAccount extends StatefulWidget {
  final String acc;
  final String pwd;
  final String pics;
  final int index;
  const CardAccount({super.key, required this.acc,  required this.pwd, required this.pics, required this.index});

  @override
  State<CardAccount> createState() => _CardAccountState();
}

class _CardAccountState extends State<CardAccount> {
  bool _seePass = false;
  
  @override
  Widget build(BuildContext context) {
  final TextEditingController password = TextEditingController(text : widget.pwd);
  final provider = Provider.of<ProviderGudang>(context);
  final userImage = provider.getUserImage(widget.index);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: EdgeInsetsDirectional.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
      child: Column(
        children:[ 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children:[ 
                   CircleAvatar(
                radius: 25,
                backgroundImage: userImage,
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
          if(widget.index!=0)
          Divider(
            color: Colors.grey,
            height: 30,
            endIndent: 7,
            indent: 7,
          ),
          widget.index != 0
          ? Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text("Feature List", style: TextStyle(fontSize: 18),),
                CheckboxListTile(
                  value: Provider.of<ProviderGudang>(context).Gudang.user[3][widget.index][0],
                  onChanged: (bool? val){
                    setState(() {
                      Provider.of<ProviderGudang>(context,listen: false).changefeature(widget.index, 0);
                    });
                  },
                  title: Text("Account List",style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text("User can access Account List to see password and set another user role",style: TextStyle(fontSize: 13),),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                  side: BorderSide(color: Colors.blue),
                ),
                CheckboxListTile(
                  value: Provider.of<ProviderGudang>(context).Gudang.user[3][widget.index][1],
                  onChanged: (bool? val){
                    setState(() {
                      Provider.of<ProviderGudang>(context,listen: false).changefeature(widget.index, 1);
                    });
                  },
                  title: Text("Add New Product",style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text("User can access Add New Product",style: TextStyle(fontSize: 13),),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                  side: BorderSide(color: Colors.blue),
                ),
                CheckboxListTile(
                  value: Provider.of<ProviderGudang>(context).Gudang.user[3][widget.index][2],
                  onChanged: (bool? val){
                    setState(() {
                      Provider.of<ProviderGudang>(context,listen: false).changefeature(widget.index, 2);
                    });
                  },
                  title: Text("Edit Product",style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text("User can access Edit and Delete product",style: TextStyle(fontSize: 13),),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                  side: BorderSide(color: Colors.blue),
                ),
                CheckboxListTile(
                  value: Provider.of<ProviderGudang>(context).Gudang.user[3][widget.index][3],
                  onChanged: (bool? val){
                    setState(() {
                      Provider.of<ProviderGudang>(context,listen: false).changefeature(widget.index, 3);
                    });
                  },
                  title: Text("Sales",style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text("User can access Sales Page and Add New Sales Transaction",style: TextStyle(fontSize: 13),),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                  side: BorderSide(color: Colors.blue),
                ),
                CheckboxListTile(
                  value: Provider.of<ProviderGudang>(context).Gudang.user[3][widget.index][4],
                  onChanged: (bool? val){
                    setState(() {
                      Provider.of<ProviderGudang>(context,listen: false).changefeature(widget.index, 4);
                    });
                  },
                  title: Text("Purchasing",style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text("User can access Purchasing Page and Add New Purchase Transaction",style: TextStyle(fontSize: 13),),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                  side: BorderSide(color: Colors.blue),
                ),
              ]
            ),
          )
          : Container()
        ]
      ),
    );
  }
}