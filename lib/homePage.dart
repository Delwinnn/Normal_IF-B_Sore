import 'package:agile_git/AboutPage.dart';
import 'package:agile_git/AccountList.dart';
import 'package:agile_git/PurchasingPage.dart';
import 'package:agile_git/SalesPage.dart';
import 'package:agile_git/StockPage.dart';
import 'package:agile_git/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'ProfilePage.dart';

class HomeView extends StatefulWidget {
  final Company data;
  final String user;
  final dynamic tujuan;

  HomeView({Key? key, required this.data, required this.user})
      : tujuan = [PurchasingView(), SalesView(), StockView(), AboutView(), ProfilePage()],
        super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int select = 2;
  @override
  Widget build(BuildContext context) {
    int totalpurchase = Provider.of<ProviderGudang>(context).totalpurchase();
    int totalsales = Provider.of<ProviderGudang>(context).totalsales();
    int totalqpurchase = Provider.of<ProviderGudang>(context).totalqpurchase();
    int totalqsales = Provider.of<ProviderGudang>(context).totalqsales();
    List<int> total = [totalpurchase,totalsales];
    List<int> totalq = [totalqpurchase,totalqsales];
    List labelperform = ["Purchase", "Sales"];
    final indexUser = widget.data.user[0].indexOf(widget.user); 
      return WillPopScope(
      onWillPop: () async {
        return Future.value(false); 
      },
      child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.data.companyname,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Row(
              children: [
                SizedBox(width: 8), 
                CircleAvatar(
                  radius: 20, 
                  backgroundImage: NetworkImage("${widget.data.user[2][indexUser]}"),
                ),
                SizedBox(width: 8),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                'Welcome ${widget.user}...',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15,),
              Image.asset(
                'assets/logo.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              SizedBox(height: 15,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 7,
                  color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text("Performance",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 20),)
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2
                        ),
                        itemCount: 2,
                        padding: EdgeInsets.all(5),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(0),
                            child: Card(
                              color: Colors.white,
                              elevation: 8,
                              child: Container(
                                padding: EdgeInsets.all(7),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${labelperform[index]}",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                    SizedBox(height: 2,),
                                    Divider(),
                                    SizedBox(height: 2,),
                                    Text("Total Transaction",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                    Text(
                                      NumberFormat.currency(
                                      locale: 'id_ID',
                                      symbol: 'Rp. ',
                                      decimalDigits: 2,
                                    ).format(total[index])),
                                    SizedBox(height: 10,),
                                    Text("Total Quantity",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                    Text("${totalq[index]}"),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AccountView(),)
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, size: 25),
                      SizedBox(width: 10),
                      Text("Account List", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    elevation: 10,
                    fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      
    ),);
  }
}
