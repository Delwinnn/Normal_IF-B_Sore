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
  List data = [];
  List filtered = [];

  @override
  void initState() {
    super.initState();
    data = Provider.of<ProviderGudang>(context,listen: false).Gudang.purchase;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false); 
      },
      child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Purchasing", style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(7),
        color: Colors.grey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              child: TextField(
                controller: search,
                onChanged: (value) {
                  setState(() {
                    if (value!=""){
                      filtered=[];
                      for (int i = 0;i < data.length; i++) {
                        if (data[i][0].toLowerCase().contains(value.toLowerCase()) || data[i][2].toLowerCase().contains(value.toLowerCase()) || data[i][3].toLowerCase().contains(value.toLowerCase())) {
                          filtered.add(data[i]);
                        }
                      }
                    }
                    else{
                      filtered = data;
                    }
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Colors.black),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Search",
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...search.text == ""
                    ? Provider.of<ProviderGudang>(context).Gudang.purchase.reversed.toList().map<Widget>((item) {
                      return CardTrans(x: item, type:"Purchase");
                    })
                    : filtered.reversed.toList().map<Widget>((item) {
                      return CardTrans(x: item, type:"Purchase");
                    }),
                  ],
                ),
              )
            )
          ]
        )
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddTransaction(type: "",),)
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
      
    ),
    );
  }
}