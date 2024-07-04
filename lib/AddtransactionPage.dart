import 'package:Stokify/CardListItem.dart';
import 'package:Stokify/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AddTransaction extends StatefulWidget {
  final String type;
  const AddTransaction({super.key, required this.type});


  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController qty = TextEditingController();
  TextEditingController item = TextEditingController();
  List <dynamic> ordered = [];
  int total = 0;
  bool isFound = true;
  bool isEdit = false;
  int index = -1;
  String jenis = "";
  List product = [];
  DateTime date = DateTime.now();
  List semuaItem = [];

  @override
  void initState() {
    super.initState();
    jenis = widget.type;
    semuaItem = Provider.of<ProviderGudang>(context, listen: false).Gudang.product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(jenis=="Sales" ? "Add Sales" : "Add Purchase"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: 5,),
              Text(jenis=="Sales" ? "New Sales" : "New Purchase",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Row(
                children:[
                  Text("Date :",style: TextStyle(fontSize: 16),)
                ]
              ),
              SizedBox(height: 5,),
              ListTile(
                title: Text("${DateFormat("E, dd-MM-yyyy").format(date)}"),
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.black)
                ),
                trailing: Icon(Icons.date_range, color: Colors.blue,),
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: date, 
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2200)
                  ).then((value) {
                    setState(() {
                      if (value!=null) {
                        date = value;
                      }
                    });
                  },);
                },
              ),
              SizedBox(height: 20,),
              Container(
                height: 60,
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    labelText: jenis=="Sales" ? "Customer" : "Supplier",
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(children: [
                Text("List Order",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
              ]),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                color: Colors.grey,
                height: 1,
              ),
              SizedBox(height: 5,),
              if (ordered.length>0)
                ...ordered.map((e) {
                  return Container( 
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey,),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(1, 1)
                        )
                      ]
                    ),
                    child: Column(
                      children: [
                        ListItem(data: e),
                        Divider(
                          height: 10,
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  item.text = e[1];
                                  product=e;
                                  price.text = "${e[2]}";
                                  qty.text = "${e[3]}";
                                  isEdit = true;
                                  index = ordered.indexOf(e);
                                });
                              }, 
                              icon: Icon(Icons.edit,), 
                              label: Text("Edit"),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue,
                              ),
                            ),
                            SizedBox(width: 15,),
                            ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  ordered.remove(e);
                                  total = 0;
                                  for (int x = 0 ; x<ordered.length ; x++ ) {
                                    int jumlah = ordered[x][2]*ordered[x][3];
                                    total+=jumlah;
                                  }
                                });
                              }, 
                              icon: Icon(Icons.delete,), 
                              label: Text("Delete"),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.red,
                              ),
                            ),
                          ],
                        )
                      ]
                    ),
                  );
                }).toList()
              else
                Text("Order Empty"),
                SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DropdownMenu(
                    controller: item,
                    expandedInsets: EdgeInsets.all(0),
                    errorText: isFound ? null : "Item not found",
                    menuHeight: 200,
                    hintText: "Select Product",
                    dropdownMenuEntries: semuaItem.map((e) {
                      return DropdownMenuEntry(
                        value: e, label: e[1],
                      );
                    }).toList(),
                    enableSearch: true,
                    requestFocusOnTap: true,
                    enableFilter: true,
                    onSelected: (value) {
                      product=value;
                      setState(() {
                        isFound = true;
                      });
                    },
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          child: TextField(
                            controller: price,
                            textAlign: TextAlign.left,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              labelText: "Price"
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width/5.5,
                        child: TextField(
                          controller: qty,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            labelText: "Qty",
                            floatingLabelAlignment: FloatingLabelAlignment.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: isEdit
                      ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        onPressed: () {
                          setState(() {
                            if (price.text=="" || qty.text=="" || item.text=="") {
                              showDialog(
                                context: context, 
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Alert'),
                                    content: Text("Data is Incomplete"),
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
                            else if (!product.contains(item.text)) {
                              setState(() {
                                isFound = false;
                              });
                            }
                            else if (product.isEmpty) {
                              setState(() {
                                isFound = false;
                              });
                            }
                            else{
                              List <dynamic> x = [product[0],product[1].toString(),int.parse(price.text),int.parse(qty.text)];
                              ordered[index] = x;
                              total = 0;
                              for (int x = 0 ; x<ordered.length ; x++ ) {
                                int jumlah = ordered[x][2]*ordered[x][3];
                                total+=jumlah;
                              }
                              item.text = "";
                              price.text = "";
                              qty.text = "";
                              product = [];
                              isEdit = false;
                            }
                          });
                        }, 
                        child: Text("Edit",style: TextStyle(color: Colors.white),)
                      )
                        : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[500],
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        onPressed: () {
                          setState(() {
                            if (price.text=="" || qty.text=="" || item.text=="") {
                              showDialog(
                                context: context, 
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Alert'),
                                    content: Text("Data is Incomplete"),
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
                            else if (!product.contains(item.text)) {
                              setState(() {
                                isFound = false;
                              });
                            }
                            else if (product.isEmpty) {
                              setState(() {
                                isFound = false;
                              });
                            }
                            else{
                              List <dynamic> x = [product[0],product[1].toString(),int.parse(price.text),int.parse(qty.text)];
                              ordered.add(x);
                              total = 0;
                              for (int x = 0 ; x<ordered.length ; x++ ) {
                                int jumlah = ordered[x][2]*ordered[x][3];
                                total+=jumlah;
                              }
                              item.text = "";
                              price.text = "";
                              qty.text = "";
                              product = [];
                            }
                          });
                        }, 
                        child: Text("Add",style: TextStyle(color: Colors.white),)
                      ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    color: Colors.grey,
                    height: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total :",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                      Text(
                        NumberFormat.currency(
                          locale: 'id_ID',
                          symbol: 'Rp. ',
                          decimalDigits: 2,
                        ).format(total),
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    color: Colors.grey,
                    height: 1,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            List alldata = [DateFormat("dd-MM-yyyy").format(date),name.text,ordered,total,jenis];
                            Provider.of<ProviderGudang>(context,listen: false).addTransaction(alldata,context);
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
                          showDialog(
                            context: context, 
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Discard"),
                                content: Text("Are you sure you want to discard order?"),
                                actions: [
                                  TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancel",style: TextStyle(color: Colors.grey[800]),),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                              child: Text("Discard",style: TextStyle(color: Colors.white)),
                            ),
                                ],
                              );
                            },
                          );
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
            ]
          ),
        ),
      )
    );
  }
}


