import 'package:agile_git/CardListItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class PurchaseDetail extends StatelessWidget {
  final List dataTransaksi;
  final String type;
  const PurchaseDetail({super.key, required this.dataTransaksi,  required this.type});

  @override
  Widget build(BuildContext context) {
    final List brg = dataTransaksi[4];   
    final int total = brg.fold(0, (previousValue, element) => previousValue + (element[2]*element[3] as int));
    return Scaffold(
      appBar: AppBar(
        title: Text(type=="Sales"
          ?'Sales Detail' : "Purchase Detail",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${dataTransaksi[0]}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Divider(
              color: Colors.grey,
              thickness: 2,
              height: 20,
              indent: 0,
              endIndent: 0,
            ),
            Text("Date : ${dataTransaksi[1]}",style: TextStyle(fontSize: 20),),
            SizedBox(height: 7),
            Row(
              children: [
                Text(type=="Sales" ? "Customer : " : "Supplier : ",style: TextStyle(fontSize: 20),),
                Expanded(
                  child: Text("${dataTransaksi[2]}",style: TextStyle(fontSize: 20),)
                )
              ],
            ),
            SizedBox(height: 7),
            Text("User : ${dataTransaksi[3]}",style: TextStyle(fontSize: 20)),
            Divider(
              color: Colors.grey,
              thickness: 2,
              height: 20,
              indent: 0,
              endIndent: 0,
            ),
            SizedBox(height: 10,),
            Text("List Item", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Column(
              children: brg.map((e) => 
                Container( 
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
                      ListItem(data: e)
                    ]
                  ),
                )
              ).toList(),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.white,
                boxShadow: [
                BoxShadow(offset: Offset(1, 1))
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total : ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  Text(
                    NumberFormat.currency(
                      locale: 'id_ID',
                      symbol: 'Rp. ',
                      decimalDigits: 2,
                    ).format(total),
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}