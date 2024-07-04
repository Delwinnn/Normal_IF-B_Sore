import 'package:Stokify/AddStockPage.dart';
import 'package:Stokify/CardStock.dart';
import 'package:Stokify/provider.dart';
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

  void sortProducts(String sortBy) {
    setState(() {
      List data = List.from(datastock);
      List filter = List.from(filtered);
      if (sortBy == "Product") {
        data.sort((a, b) => a[1].compareTo(b[1]));
        filter.sort((a, b) => a[1].compareTo(b[1]));
        datastock = data;
        filtered = filter;
      } else if (sortBy == "Stock") {
        data.sort((a, b) => a[3].compareTo(b[3]));
        filter.sort((a, b) => a[3].compareTo(b[3]));
        datastock = data;
        filtered = filter;
      } else if (sortBy == "RProduct") {
        data.sort((a, b) => b[1].compareTo(a[1]));
        filter.sort((a, b) => b[1].compareTo(a[1]));
        datastock = data;
        filtered = filter;
      } else if (sortBy == "RStock") {
        data.sort((a, b) => b[3].compareTo(a[3]));
        filter.sort((a, b) => b[3].compareTo(a[3]));
        datastock = data;
        filtered = filter;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    datastock = Provider.of<ProviderGudang>(context,listen: false).Gudang.product;
  }

  @override
  Widget build(BuildContext context) {
    ProviderGudang prov = Provider.of<ProviderGudang>(context,listen: false);
    int indexUser = prov.Gudang.user[0].indexOf(prov.Gudang.usinguser);
     return WillPopScope(
      onWillPop: () async {
        return Future.value(false); 
      },
      child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,      
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Stock", style: TextStyle(color: Colors.white),),
        actions: [
          sortMenu(context,sortProducts)
        ],
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
                    ? datastock.map<Widget>((item) {
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
      floatingActionButton: !Provider.of<ProviderGudang>(context).Gudang.user[3][indexUser][1] 
        ? null
        : Tooltip(
          message: "New Product",
          child: ElevatedButton(
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
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    ),
     );
  }
}

Widget sortMenu(BuildContext context, Function(String) onSortSelected){
  return PopupMenuButton(
    child: Tooltip(
      message: "Sort by",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.sort, color: Colors.white,size: 20,),
          SizedBox(width: 8,)
        ],
      ),
    ),
    offset: Offset(0, 35),
    color: Colors.white,
    itemBuilder: (context) => <PopupMenuEntry>[
      PopupMenuItem(
        child: Row(
          children: [
            Text("A-Z"),
            SizedBox(width: 5,),
            Text("Product",style: TextStyle(color: Colors.black),)
          ]
        ),
        onTap: () {
          onSortSelected("Product");
        },
      ),
      PopupMenuItem(
        child: Row(
          children: [
            Text("Z-A"),
            SizedBox(width: 5,),
            Text("Product",style: TextStyle(color: Colors.black),)
          ]
        ),
        onTap: () {
          onSortSelected("RProduct");
        },
      ),
      PopupMenuItem(
        child: Row(
          children: [
            Text("0-9"),
            SizedBox(width: 5,),
            Text("Stock",style: TextStyle(color: Colors.black),)
          ]
        ),
        onTap: () {
          onSortSelected("Stock");
        },
      ),
      PopupMenuItem(
        child: Row(
          children: [
            Text("9-0"),
            SizedBox(width: 5,),
            Text("Stock",style: TextStyle(color: Colors.black),)
          ]
        ),
        onTap: () {
          onSortSelected("RStock");
        },
      ),
    ]
  );
}