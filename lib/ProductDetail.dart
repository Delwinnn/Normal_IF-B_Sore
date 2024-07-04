
import 'package:Stockify/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

XFile? _imageedit = null;
final ImagePicker _picker = ImagePicker();
int? _valimg = 0;

class InfoProduct extends StatefulWidget {
  final List data;
  const InfoProduct({super.key,required this.data});

  @override
  State<InfoProduct> createState() => _InfoProductState();
}

class _InfoProductState extends State<InfoProduct> {
  TextEditingController _link = TextEditingController();
  bool editing = false;
  int historyindex = 0;
  Widget? _gambar = null;
  InputDecoration word = const InputDecoration(
    enabled: false,
    border: InputBorder.none, 
    isCollapsed: true,
  );
  InputDecoration inputan = const InputDecoration(
    enabled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    )
  );
  List historys = [];

  @override
  void dispose() {
    super.dispose();
    _imageedit = null;
    _valimg = 0;
  }

  @override
  Widget build(BuildContext context) {
    List sales = Provider.of<ProviderGudang>(context).Gudang.sales;
    List purchase = Provider.of<ProviderGudang>(context).Gudang.purchase;
    List historys = historyindex==0 ? purchase : sales;
    int found = 0;
    Company provider = Provider.of<ProviderGudang>(context,listen: false).Gudang;
    int indexUser = provider.user[0].indexOf(provider.usinguser);
    int indexProduct = provider.product.indexOf(widget.data);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Product", style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text("Info Product",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
              ),
              SizedBox(height: 10,),
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: _gambar == null ? widget.data[0] : _gambar,
                ),
              ),
              SizedBox(height: 15,),
              if(_valimg == 1)
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
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
                          _gambar = Image(
                            image: NetworkImage(_link.text),
                            height: 90,
                            width: 90,
                          );
                          _valimg = 0;
                          editing = true;
                        });
                      }, 
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)
                      ),
                      icon: Icon(Icons.done,color: Colors.white,size: 35)
                    ),
                  ]
                ),
              ),
              if (editing == false && Provider.of<ProviderGudang>(context).Gudang.user[3][indexUser][2])
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
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
                                        if(image!=null) {
                                          Uint8List pic = await image.readAsBytes();
                                          setState(() {
                                            _gambar = Image(
                                              image: MemoryImage(pic),
                                              height: 90,
                                              width: 90,
                                              fit: BoxFit.contain,
                                            );
                                            editing = true;
                                          });
                                        }
                                      },
                                      leading: Icon(Icons.camera_alt_outlined,size: 30,),
                                      title: Text('Capture from Camera',style: TextStyle(fontSize: 18),),
                                    ),
                                    ListTile(
                                      onTap:() async {
                                        Navigator.pop(context);
                                        _valimg = 0;
                                        final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                                        if(image!=null) {
                                          Uint8List pic = await image.readAsBytes();
                                          setState(() {
                                            _gambar = Image(
                                              image: MemoryImage(pic),
                                              height: 90,
                                              width: 90,
                                              fit: BoxFit.contain,
                                            );
                                            editing = true;
                                          });
                                        }
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
                    });
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white
                  ),
                  icon: Icon(Icons.change_circle), 
                  label: Text("Change")
                ),
              ),
              if (_gambar != null && editing == true)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        Widget? newData = _gambar;
                        Provider.of<ProviderGudang>(context,listen: false).updateDataStock(indexProduct, newData);
                        editing = !editing;
                      });
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white
                    ),
                    icon: Icon(Icons.save), 
                    label: Text("Save")
                  ),
                  SizedBox(width: 25,),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        editing = !editing;
                        _gambar = null;
                      });
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white
                    ),
                    icon: Icon(Icons.cancel), 
                    label: Text("Cancel")
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Text("Product Name : ",style: TextStyle(fontSize: 13),),
              Text(widget.data[1],style: TextStyle(fontSize: 18),),
              SizedBox(height: 15,),
              Text("Brand Name : ",style: TextStyle(fontSize: 13),),
              Text(widget.data[2],style: TextStyle(fontSize: 18),),
              SizedBox(height: 15,),
              Text("Stock : ",style: TextStyle(fontSize: 13),),
              Text("${widget.data[3]}",style: TextStyle(fontSize: 18),),
              SizedBox(height: 15,),
              if (Provider.of<ProviderGudang>(context).Gudang.user[3][indexUser][2])
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Alert"),
                          content: Text("Are you sure you want to delete product?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Provider.of<ProviderGudang>(context,listen: false).removeproduct(widget.data);
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              child: Text("Delete", style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        );
                      },
                    );
                  }, 
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white
                  ),
                  icon: Icon(Icons.delete), 
                  label: Text("Delete Product")
                ),
              ),
              SizedBox(height: 15,),
              Divider(
                thickness: 1,
                height: 10,
              ),
              SizedBox(height: 10,),
              Center(
                child: Text("Transaction History",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ),
              DefaultTabController(
                initialIndex: historyindex,
                length: 2, 
                child: TabBar(
                  indicatorColor: Colors.blue,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.blue,
                  labelPadding: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  onTap: (value) {
                    setState(() {
                      historyindex = value;
                    });
                  },
                  tabs: [
                    Text("Purchase"),
                    Text("Sales"),
                  ]
                )
              ),
              Column(
                children: [
                  ...historys.map((e) {
                    for (int i = 0 ; i<e[4].length ; i++) {
                      if(e[4][i].contains("${widget.data[1]}")) {
                        found+=1;
                        return Card(
                          margin: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                          child: ListTile(
                            title: Row(
                              children: [
                                Text("${e[1]}"),
                                Spacer(),
                                Text('${e[0]}'),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Customer: ${e[2]}'),
                                Row(
                                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Quantity: ${e[4][i][3]}'),
                                    Text('Price: ${
                                      NumberFormat.currency(
                                        locale: 'id_ID',
                                        symbol: '',
                                        decimalDigits: 0,
                                      ).format(e[4][i][2])
                                    }'),
                                    ],
                                ),
                                Divider(
                                  color: Colors.black, 
                                  height: 16, 
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total:'),
                                    Text(
                                      NumberFormat.currency(
                                        locale: 'id_ID',
                                        symbol: 'Rp. ',
                                        decimalDigits: 2,
                                      ).format(e[4][i][3]*e[4][i][2]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    }
                    return SizedBox();
                  }),
                  if (found==0)
                  Center(
                    child: Text("No History for this Product.",style: TextStyle(fontSize: 20),)
                  ),
                  SizedBox(height: 50,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

