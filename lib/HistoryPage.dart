import 'package:agile_git/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  final String name;
  HistoryPage({super.key,required this.name});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List historys = [];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List sales = Provider.of<ProviderGudang>(context).Gudang.sales;
    List purchase = Provider.of<ProviderGudang>(context).Gudang.purchase;
    List historys = _selectedIndex==0 ? purchase : sales;
    int found = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('History Page'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey[350],
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text("${_selectedIndex==0 ? "Purchase" : "Sales"} History",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              Divider(
                color: Colors.black, 
                height: 16, 
              ),
              ...historys.map((e) {
                for (int i = 0 ; i<e[4].length ; i++) {
                  if(e[4][i].contains("${widget.name}")) {
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
              Column(
                children:[
                  SizedBox(height: 30,),
                  Text("No History for this Product.",style: TextStyle(fontSize: 20),) 
                ]
              ) 
            ],
          )
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "Purchase",
            icon: Icon(Icons.attach_money),
          ),
          BottomNavigationBarItem(
            label: "Sales",
            icon: Icon(Icons.sell),
          ),
        ],
      ),
    );
  }
}