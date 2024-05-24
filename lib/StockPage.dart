import 'package:agile_git/AddStockPage.dart';
import 'package:agile_git/CardStock.dart';
import 'package:agile_git/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class StockView extends StatefulWidget {
  const StockView({super.key});

  @override
  State<StockView> createState() => _StockViewState();
}

class _StockViewState extends State<StockView> {
  TextEditingController search = TextEditingController();
  List datastock = [];
  List filtered = [];

  @override
  void initState() {
    super.initState();
    datastock = Provider.of<ProviderGudang>(context,listen: false).Gudang.product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Stock", style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
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
                      for (int i = 0;i < datastock.length; i++) {
                        if (datastock[i][1].toLowerCase().contains(value.toLowerCase()) || datastock[i][2].toLowerCase().contains(value.toLowerCase())) {
                          filtered.add(datastock[i]);
                        }
                      }
                    }
                    else{
                      filtered = datastock;
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
            SizedBox(height: 5,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...search.text == ""
                    ? Provider.of<ProviderGudang>(context).Gudang.product.map<Widget>((item) {
                      return CardStock(produk: item);
                    })
                    : filtered.map<Widget>((item) {
                      return CardStock(produk: item);
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
          setState(() {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddStock(),)
            );
          });
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