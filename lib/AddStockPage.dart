import 'package:agile_git/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddStock extends StatefulWidget {
  const AddStock({super.key});

  @override
  State<AddStock> createState() => _AddStockState();
}

class _AddStockState extends State<AddStock> {
  TextEditingController link = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController stock = TextEditingController();
  int? valstock = 1;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("Add Product", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Add New Product", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                ]
              ),
              SizedBox(height: 20,),
              Text("Link Image : ",style: TextStyle(fontSize: 18),),
              SizedBox(height: 10,),
              TextField(
                maxLines: null,
                controller: link,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "https://.........",
                  hintStyle: TextStyle(fontSize: 16)
                ),
              ),
              SizedBox(height: 20,),
              Text("Product Name : ",style: TextStyle(fontSize: 18),),
              SizedBox(height: 10,),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Keyboard",
                  hintStyle: TextStyle(fontSize: 16)
                ),
              ),
              SizedBox(height: 20,),
              Text("Brand Name : ",style: TextStyle(fontSize: 18),),
              SizedBox(height: 10,),
              TextField(
                controller: brand,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Asus",
                  hintStyle: TextStyle(fontSize: 16)
                ),
              ),
              SizedBox(height: 15,),
              Text("Stock : ",style: TextStyle(fontSize: 18),),
              RadioListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 3),
                value: 1, 
                groupValue: valstock, 
                onChanged: (value) {
                  setState(() {
                    valstock = value;
                  });
                },
                title: Text("New Stock"),
                subtitle: Text("Default Stock : 0"),
              ),
              RadioListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 3),
                value: 2, 
                groupValue: valstock, 
                onChanged: (value) {
                  setState(() {
                    valstock = value;
                  });
                },
                title: Text("Old Stock"),
                subtitle: Text("You can change the default stock"),
              ),
              if (valstock == 2 ) 
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: stock,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      labelText: "Stock",
                    ),
                  ),
                ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        List item = [link.text, name.text, brand.text, valstock, stock.text];
                        Provider.of<ProviderGudang>(context,listen: false).addStock(context, item);
                      });
                    }, 
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      backgroundColor: Colors.green[500],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                    icon: Icon(Icons.save), 
                    label: Text("Save",style: TextStyle(fontSize: 17),)
                  ),
                  SizedBox(width: 15,),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                    }, 
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      backgroundColor: Colors.red[500],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                    icon: Icon(Icons.cancel), 
                    label: Text("Cancel",style: TextStyle(fontSize: 17),)
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}