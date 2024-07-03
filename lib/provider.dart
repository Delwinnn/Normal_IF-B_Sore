import 'dart:io';
import 'dart:convert';
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
        "https://i.pinimg.com/736x/da/4a/fa/da4afa2d21a74a4f829f86971e826b69.jpg",
        "https://i.pinimg.com/736x/54/72/d1/5472d1b09d3d724228109d381d617326.jpg"
      ],
      [[true,true,true,true,true],[false,false,false,true,false],[false,true,false,false,true]]
    ], 
    product: [
      [Image(
        image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cl52179'),
        height: 90,
        width: 90,
        fit: BoxFit.contain,
      ),
      "EKL Hanger Baju Merah","EKL",230],
      [Image(
        image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r98r-lsct022cibx568'),
        height: 90,
        width: 90,
        fit: BoxFit.contain,
      ),
      "EKL Gantungan Baju Lidi Plastik","EKL",230],
      [Image(
        image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cjqhl13'),
        height: 90,
        width: 90,
        fit: BoxFit.contain,
      ),"EKL Ember Cor Plastik Hijau","EKL",250],
      [Image(
        image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r98v-lsct022cgxmu09'),
        height: 90,
        width: 90,
        fit: BoxFit.contain,
      ),"EKL Baskom Plastik 042 Ukuran Sedang","EKL",300],
      [Image(
        image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r990-lsct022cny6xe5'),
        height: 90,
        width: 90,
        fit: BoxFit.contain,
      ),"EKL Baskom Plastik 783 Ukuran Besar","EKL",300],
      [Image(
        image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r98y-lthnk07b51xe03'),
        height: 90,
        width: 90,
        fit: BoxFit.contain,
      ),"OllO Keran Air PVC Premium Ukuran 1/2","OllO",200],
      [Image(
        image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r98u-lt7kukaiu8ue77'),
        height: 90,
        width: 90,
        fit: BoxFit.contain,
      ),"Raskam Plastik PVC EKL Premium Quality","EKL",220],
      [Image(
        image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r98z-lti1e8325da029'),
        height: 90,
        width: 90,
        fit: BoxFit.contain,
      ),"OllO Keran Air Putar PVC Premium ukuran 1/2","OllO",250],
    ], 
    salescode: 3,
    sales: [
      ["S000001","05-03-2024","Jokiiii","SELLER",
      [
        [Image(
          image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cl52179'),
          height: 90,
          width: 90,
          fit: BoxFit.contain,
        ),"EKL Hanger Baju Merah",22000,70],
        [Image(
          image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cjqhl13'),
          height: 90,
          width: 90,
          fit: BoxFit.contain,
        ),"EKL Ember Cor Plastik Hijau",15000,50]
      ],
      2290000],
      ["S000002","10-03-2024","Bobyyyy","SELLER",
      [
        [Image(
          image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r98z-lti1e8325da029'),
          height: 90,
          width: 90,
          fit: BoxFit.contain,
        ),"OllO Keran Air Putar PVC Premium ukuran 1/2",30000,50],
        [Image(
          image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r98y-lthnk07b51xe03'),
          height: 90,
          width: 90,
          fit: BoxFit.contain,
        ),"OllO Keran Air PVC Premium Ukuran 1/2",30000,100]
      ],
      4500000],
      ["S000003","20-03-2024","Pinyyyy","OWNER",
      [
        [Image(
          image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r98u-lt7kukaiu8ue77'),
          height: 90,
          width: 90,
          fit: BoxFit.contain,
        ),"Raskam Plastik PVC EKL Premium Quality",60000,80],
        [Image(
          image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r98r-lsct022cibx568'),
          height: 90,
          width: 90,
          fit: BoxFit.contain,
        ),"EKL Gantungan Baju Lidi Plastik",18000,70],
      ],
      6060000],
    ], 
    purchasecode: 3,
    purchase: [
      ["P000001","05-03-2024","Budiiiii","PURCHASER",
      [
        [Image(
          image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cl52179'),
          height: 90,
          width: 90,
          fit: BoxFit.contain,
        ),"EKL Hanger Baju Merah",15000,300],
        [Image(
          image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cjqhl13'),
          height: 90,
          width: 90,
          fit: BoxFit.contain,
        ),"EKL Ember Cor Plastik Hijau",15000,300],
        [Image(
          image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r98r-lsct022cibx568'),
          height: 90,
          width: 90,
          fit: BoxFit.contain,
        ),"EKL Gantungan Baju Lidi Plastik",12000,300]
      ],
      12600000],
      ["P000002","09-03-2024","Andiiiii","OWNER",
      [
        [Image(
          image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r98v-lsct022cgxmu09'),
          height: 90,
          width: 90,
          fit: BoxFit.contain,
        ),"EKL Baskom Plastik 042 Ukuran Sedang",30000,300],
        [Image(
          image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r98u-lt7kukaiu8ue77'),
          height: 90,
          width: 90,
          fit: BoxFit.contain,
        ),"Raskam Plastik PVC EKL Premium Quality",35000,300],
        [Image(
          image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r990-lsct022cny6xe5'),
          height: 90,
          width: 90,
          fit: BoxFit.contain,
        ),"EKL Baskom Plastik 783 Ukuran Besar",45000,300]
      ],
      33000000],
      ["P000003","11-03-2024","Rianaaaa","PURCHASER",
      [
        [Image(
          image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r98y-lthnk07b51xe03'),
          height: 90,
          width: 90,
          fit: BoxFit.contain,
        ),"OllO Keran Air PVC Premium Ukuran 1/2",25000,300],
        [Image(
          image: NetworkImage('https://down-id.img.susercontent.com/file/id-11134207-7r98z-lti1e8325da029'),
          height: 90,
          width: 90,
          fit: BoxFit.contain,
        ),"OllO Keran Air Putar PVC Premium ukuran 1/2",25000,300]
      ],
      15000000],
    ],
  );

  void changefeature(int indexuser, int urutanfitur) {
    Gudang.user[3][indexuser][urutanfitur] = !Gudang.user[3][indexuser][urutanfitur];
    notifyListeners();
  }

  void removeproduct(List x) {
    Gudang.product.remove(x);
    notifyListeners();
  }

  int totalpurchase (){
    int total = 0;
    for (var data in Gudang.purchase) {
      total += int.parse(data[5].toString());
    }
    return total;
  }

  int totalsales (){
    int total = 0;
    for (var data in Gudang.sales) {
      total += int.parse(data[5].toString());
    }
    return total;
  }

  int totalqpurchase () {
    int total = 0;
    for (var data in Gudang.purchase) {
      for (var x in data[4]){
        total += int.parse(x[3].toString());
      }
    }
    return total;
  }

  int totalqsales () {
    int total = 0;
    for (var data in Gudang.sales) {
      for (var x in data[4]){
        total += int.parse(x[3].toString());
      }
    }
    return total;
  }

  void updateUsername(String oldUsername, String newUsername) {
  int userIndex = Gudang.user[0].indexOf(oldUsername);
  
  if (userIndex != -1) {
    Gudang.user[0][userIndex] = newUsername;
    Gudang.usinguser = newUsername;
    notifyListeners();
  } else {
    print('User not found or index out of range!');
  }
}


void updatePassword(String username, String oldPassword, String newPassword) {
  // Find the index of the user in the user list
  int userIndex = Gudang.user[0].indexOf(username);
  if (userIndex != -1) {
    // Check if the old password matches
    if (Gudang.user[1][userIndex] == oldPassword) {
      // Update the password at the found index
      Gudang.user[1][userIndex] = newPassword;
      notifyListeners();
    } else {
      // Handle case where old password doesn't match
      print('Old password is incorrect!');
    }
  } else {
    // Handle case where user is not found
    print('User not found!');
  }
}


  void updateUserImage(int index, dynamic imageProvider) {
    if (imageProvider is String) {
      if (imageProvider.startsWith('http') ||
          imageProvider.startsWith('https')) {
        Gudang.user[2][index] = imageProvider;
      } else {
        final bytes = base64Decode(imageProvider);
        Gudang.user[2][index] = base64Encode(bytes);
      }
    } else if (imageProvider is MemoryImage) {
      final bytes = (imageProvider as MemoryImage).bytes;
      final base64String = base64Encode(bytes);
      Gudang.user[2][index] = base64String;
    }
    notifyListeners();
  }

  ImageProvider getUserImage(int index) {
    final userImage = Gudang.user[2][index];
    if (userImage.startsWith('http') || userImage.startsWith('https')) {
      return NetworkImage(userImage);
    } else {
      final bytes = base64Decode(userImage);
      return MemoryImage(bytes);
    }
  }

  void updateDataStock(int index, Widget? newData){
    Gudang.product[index][0] = newData;
    notifyListeners();
  }

  void addStock(BuildContext context, List item, int? valimg) {
    if (item[1] == "" || item[2] == "" || (item[3] == 2 && item[4] == "") || (item[0]==null || item[0]=="")) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert'),
            content: Text('Data Cannot Empty'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
    else if(newList(Gudang.product).contains(item[1])){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert'),
            content: Text('Product Name already Exist'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
    else{
      Widget gmbr = valimg==0
      ? Image(
        image: FileImage(File(item[0]!.path)),
        height: 90,
        width: 90,
        fit: BoxFit.contain,
      )
      : Image(
        image: NetworkImage(item[0]),
        height: 90,
        width: 90,
      );
      List result = [gmbr, item[1], item[2], item[3]==2 ? int.parse(item[4]) : 0];
      Gudang.product.add(result);
      Navigator.of(context).pop(true);
    }
    notifyListeners();
  }

  void addAccount(String w, String x, String y, List<bool> z) {
    Gudang.user[0].add(w);
    Gudang.user[1].add(x);
    Gudang.user[2].add(y);
    Gudang.user[3].add(z);
    notifyListeners();
  }

  void addTransaction(List dataorder, BuildContext context) {
    if (dataorder[2].length==0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert'),
            content: Text("Please add order before save"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
    else if (dataorder[1].trim()=="") {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert'),
            content: Text(dataorder[4]=="Sales" ? "Please input Customer Name before save" : "Please input Supplier Name before save"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
    else{
      String typee = dataorder[4];
      String numb = typee == "Sales" ? (Gudang.salescode+1).toString().padLeft(6,"0") : (Gudang.purchasecode+1).toString().padLeft(6,"0");
      typee == "Sales" ? Gudang.salescode+=1 : Gudang.purchasecode+=1;
      String code = typee == "Sales" ? "S" : "P";
      String user = Gudang.usinguser;
      List alldata = ["${code+numb}",dataorder[0],dataorder[1],user,dataorder[2],dataorder[3]];
      typee == "Sales" 
      ? Gudang.sales.add(alldata)
      : Gudang.purchase.add(alldata);
      for (int i = 0 ; i<dataorder[2].length ; i++) {
        for (int j = 0 ; j<Gudang.product.length ; j++) {
          if (Gudang.product[j].contains(dataorder[2][i][1])) {
            typee == "Sales" 
            ? Gudang.product[j][3] = Gudang.product[j][3]-dataorder[2][i][3] 
            : Gudang.product[j][3] = Gudang.product[j][3]+dataorder[2][i][3];
          }
        }
      }
      Navigator.of(context).pop(true);
    }
    notifyListeners();
  }
}

List<dynamic> newList(List<dynamic> inputList) {
    List hasil = [];
    inputList.forEach((subList) {
      hasil.add(subList[1]);
    });
    return hasil;
  }

SnackBar PesanSnackBar(String Pesan, bool status){
  return SnackBar(
    content: Row(
      children: [
        Icon(status == true ? Icons.check_circle : Icons.cancel ,color: status == true ? Colors.green : Colors.red ,),
        SizedBox(width: 10,),
        Text(Pesan)
      ],
    ),
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: 3),
  );
}

class BottomNav extends ChangeNotifier{
  int currentpage = 2;

  void goPage(val) {
    currentpage = val;
    notifyListeners();
  }
}