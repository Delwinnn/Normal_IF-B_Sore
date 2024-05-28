import 'dart:io';

import 'package:agile_git/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

XFile? _image = null;
final ImagePicker _picker = ImagePicker();
int? _valimg = 0;

class AddStock extends StatefulWidget {
  const AddStock({super.key});

  @override
  State<AddStock> createState() => _AddStockState();
}

class _AddStockState extends State<AddStock> {
  TextEditingController _link = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController stock = TextEditingController();
  int? valstock = 1;
  
  @override
  void dispose() {
    super.dispose();
    _image = null;
    _valimg = 0;
  }

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
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
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
              SizedBox(height: 13,),
              if(_image != null)
              Center(
                child: Image(
                  image: FileImage(File(_image!.path)),
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                ),
              )
              else if(_link.text != "")
              Center(
                child: Image(
                  image: NetworkImage(_link.text),
                  height: 200,
                  width: 200,
                ),
              ),
              if(_valimg == 1)
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      maxLines: null,
                      controller: _link,
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
                        hintText: "Image URL",
                        hintStyle: TextStyle(fontSize: 16)
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  IconButton(
                    onPressed: () {
                      setState(() {
                      });
                    }, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)
                    ),
                    icon: Icon(Icons.done,color: Colors.white,size: 35)
                  ),
                ]
              ),
              SizedBox(height: 15,),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => DraggableScrollableSheet(
                        expand: false,
                        initialChildSize: 0.6,
                        builder: (context, scrollController) => SingleChildScrollView(
                          controller: scrollController,
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [Text("Product Image",style: TextStyle(fontSize: 15),)]
                                  ),
                                  SizedBox(height: 15,),
                                  ListTile(
                                    onTap:() async {
                                      Navigator.pop(context);
                                      _valimg = 0;
                                      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                                      setState(() {
                                        _image = image;
                                      });
                                    },
                                    leading: Icon(Icons.camera_alt_outlined,size: 30,),
                                    title: Text('Capture from Camera',style: TextStyle(fontSize: 18),),
                                  ),
                                  ListTile(
                                    onTap:() async {
                                      Navigator.pop(context);
                                      _valimg = 0;
                                      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                                      setState(() {
                                        _image = image;
                                      });
                                    },
                                    leading: Icon(Icons.photo_library_outlined,size: 30,),
                                    title: Text('Choose from Gallery',style: TextStyle(fontSize: 18),),
                                  ),
                                  ListTile(
                                    onTap:() {
                                      Navigator.pop(context);
                                      setState(() {
                                        _valimg=1;
                                      });
                                    },
                                    leading: Icon(Icons.link_outlined,size: 30,),
                                    title: Text('Input Link URL',style: TextStyle(fontSize: 18),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: _valimg==0 && _image==null ? EdgeInsets.all(30) : EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: _valimg==0 && _image==null ? BorderRadius.circular(15) : BorderRadius.circular(30)
                    ),
                    elevation: 5,
                  ),
                  child: _valimg==0 && _image==null 
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_photo_alternate_rounded,size: 60,),
                      Text("Add Image",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)
                    ],
                  )
                  : Text("Change",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.blue))
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
                        List item = _valimg==0 
                        ? [_image, name.text, brand.text, valstock, stock.text] 
                        : [_link.text, name.text, brand.text, valstock, stock.text];
                        Provider.of<ProviderGudang>(context,listen: false).addStock(context, item, _valimg);
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

