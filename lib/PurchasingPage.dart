import 'package:agile_git/AddtransactionPage.dart';
import 'package:agile_git/CardTransaksi.dart';
import 'package:agile_git/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PurchasingView extends StatefulWidget {
  PurchasingView({super.key});

  @override
  State<PurchasingView> createState() => _PurchasingViewState();
}

class _PurchasingViewState extends State<PurchasingView> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List data = Provider.of<ProviderGudang>(context).Gudang.purchase;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Purchasing", style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(7),
        color: Colors.grey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: TextField(
                  controller: search,
                  onChanged: (value) {
                    
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,color: Colors.black),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Search",
                  ),
                ),
              ),
              ...data.toList().map<Widget>((item) {
                return CardTrans(x: item);
              }),
            ]
          ),
        )
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddTransaction(type: "Purchasing"),)
          );
        },
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 7,
          padding: EdgeInsets.all(18),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add,size: 28,),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}