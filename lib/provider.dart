import 'package:flutter/material.dart';

class Company{
  String companyname;
  String usinguser;
  String key;
  List user;
  List product;
  int salescode;
  List sales;
  int purchasecode;
  List purchase;

  Company({
    required this.companyname, 
    required this.usinguser, 
    required this.key, 
    required this.user, 
    required this.product, 
    required this.salescode, 
    required this.sales, 
    required this.purchasecode,
    required this.purchase
  });
}

class ProviderGudang extends ChangeNotifier{
  Company Gudang = Company(
    companyname: "Normal Store", 
    usinguser: "",
    key: "Hello", 
    user: [
      ["OWNER","SELLER","PURCHASER"],
      ["+62","123","456"],
       [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIgp6aJcoa9_mornRyWV1vDfEVlkN9mPImV4x-uz1XYQ&s",
        "https://pbs.twimg.com/profile_images/1240712818787323904/vLt5yNVn_400x400.jpg",
        "data:image/jpeg;base64,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"
      ]
    ], 
    product: [
      ["https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cl52179","EKL Hanger Baju Merah","EKL",230],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98r-lsct022cibx568","EKL Gantungan Baju Lidi Plastik","EKL",230],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cjqhl13","EKL Ember Cor Plastik Hijau","EKL",250],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98v-lsct022cgxmu09","EKL Baskom Plastik 042 Ukuran Sedang","EKL",300],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r990-lsct022cny6xe5","EKL Baskom Plastik 783 Ukuran Besar","EKL",300],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98y-lthnk07b51xe03","OllO Keran Air PVC Premium Ukuran 1/2","OllO",200],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98u-lt7kukaiu8ue77","Raskam Plastik PVC EKL Premium Quality","EKL",220],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98z-lti1e8325da029","OllO Keran Air Putar PVC Premium ukuran 1/2","OllO",250],
    ], 
    salescode: 3,
    sales: [
      ["S000001","05-03-2024","Jokiiii","OWNER",
      [["https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cl52179","EKL Hanger Baju Merah",22000,70],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cjqhl13","EKL Ember Cor Plastik Hijau",15000,50]],
      2290000],
      ["S000002","10-03-2024","Bobyyyy","SELLER",
      [["https://down-id.img.susercontent.com/file/id-11134207-7r98z-lti1e8325da029","OllO Keran Air Putar PVC Premium ukuran 1/2",30000,50],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98y-lthnk07b51xe03","OllO Keran Air PVC Premium Ukuran 1/2",30000,100]],
      4500000],
      ["S000003","20-03-2024","Pinyyyy","SELLER",
      [["https://down-id.img.susercontent.com/file/id-11134207-7r98u-lt7kukaiu8ue77","Raskam Plastik PVC EKL Premium Quality",60000,80],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98r-lsct022cibx568","EKL Gantungan Baju Lidi Plastik",18000,70],],
      6060000],
    ], 
    purchasecode: 3,
    purchase: [
      ["P000001","05-03-2024","Budiiiii","PURCHASER",
      [["https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cl52179","EKL Hanger Baju Merah",15000,300],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cjqhl13","EKL Ember Cor Plastik Hijau",15000,300],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98r-lsct022cibx568","EKL Gantungan Baju Lidi Plastik",12000,300]],
      12600000],
      ["P000002","09-03-2024","Andiiiii","OWNER",
      [["https://down-id.img.susercontent.com/file/id-11134207-7r98v-lsct022cgxmu09","EKL Baskom Plastik 042 Ukuran Sedang",30000,300],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98u-lt7kukaiu8ue77","Raskam Plastik PVC EKL Premium Quality",35000,300],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r990-lsct022cny6xe5","EKL Baskom Plastik 783 Ukuran Besar",45000,300]],
      33000000],
      ["P000003","11-03-2024","Rianaaaa","PURCHASER",
      [["https://down-id.img.susercontent.com/file/id-11134207-7r98y-lthnk07b51xe03","OllO Keran Air PVC Premium Ukuran 1/2",25000,300],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98z-lti1e8325da029","OllO Keran Air Putar PVC Premium ukuran 1/2",25000,300]],
      15000000],
    ],
  );

  void addStock(List x) {
    Gudang.product.add(x);
    notifyListeners();
  }

  void addAccount(String x, String y, String z) {
    Gudang.user[0].add(x);
    Gudang.user[1].add(y);
    Gudang.user[2].add(z);
    notifyListeners();
  }

  void addPurchase(List x) {
    Gudang.purchase.add(x);
    notifyListeners();
  }

  void addSales(List x) {
    Gudang.sales.add(x);
    notifyListeners();
  }
}

List<dynamic> listfitur = [[
    Icons.attach_money,
    Icons.sell,
    Icons.warehouse,
    Icons.info
  ],[
    "Purchasing","Sales","Stock","About"
  ]];