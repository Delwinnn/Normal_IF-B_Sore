import 'package:Stockify/CardAccount.dart';
import 'package:Stockify/provider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AccountView extends StatefulWidget {
  AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
  final List<dynamic> user = Provider.of<ProviderGudang>(context).Gudang.user[0];
  final List<dynamic> pass = Provider.of<ProviderGudang>(context).Gudang.user[1];
  final List<dynamic> picture = Provider.of<ProviderGudang>(context).Gudang.user[2];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account',
          style: TextStyle(color: Colors.white, ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue, 
      ),
      body:Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[400],
        padding: EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text("Account List",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Column(
                children: 
                  user.mapIndexed((index, e) => CardAccount(acc: user[index], pwd: pass[index], pics: picture[index],index: index,)).toList()
              ),
          ]),
        ),
      ),
    );
  }
}
