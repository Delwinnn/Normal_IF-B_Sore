import 'package:agile_git/CardTransaksi.dart';
import 'package:flutter/material.dart';

class PurchasingView extends StatefulWidget {
  PurchasingView({super.key});

  @override
  State<PurchasingView> createState() => _PurchasingViewState();
}

class _PurchasingViewState extends State<PurchasingView> {
  TextEditingController search = TextEditingController();
  List data = [
    ["P000001","05-03-2024","Budiiiii","K2",
    [["https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cl52179","EKL Hanger Baju Merah",15000,300],
    ["https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cjqhl13","EKL Ember Cor Plastik Hijau",15000,300],
    ["https://down-id.img.susercontent.com/file/id-11134207-7r98r-lsct022cibx568","EKL Gantungan Baju Lidi Plastik",12000,300]],
    12600000],
    ["P000002","09-03-2024","Andiiiii","K1",
    [["https://down-id.img.susercontent.com/file/id-11134207-7r98v-lsct022cgxmu09","EKL Baskom Plastik 042 Ukuran Sedang",30000,300],
    ["https://down-id.img.susercontent.com/file/id-11134207-7r98u-lt7kukaiu8ue77","Raskam Plastik PVC EKL Premium Quality",35000,300],
    ["https://down-id.img.susercontent.com/file/id-11134207-7r990-lsct022cny6xe5","EKL Baskom Plastik 783 Ukuran Besar",45000,300]],
    33000000],
    ["P000003","11-03-2024","Rianaaaa","K2",
    [["https://down-id.img.susercontent.com/file/id-11134207-7r98y-lthnk07b51xe03","OllO Keran Air PVC Premium Ukuran 1/2",25000,300],
    ["https://down-id.img.susercontent.com/file/id-11134207-7r98z-lti1e8325da029","OllO Keran Air Putar PVC Premium ukuran 1/2",25000,300]],
    15000000],
  ];

  @override
  Widget build(BuildContext context) {
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