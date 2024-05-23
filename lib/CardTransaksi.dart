import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:agile_git/TransactionDetail.dart';

class CardTrans extends StatefulWidget {
  final List x;
  final String type;
  const CardTrans({super.key, required this.x, required this.type});

  @override
  State<CardTrans> createState() => _CardTransState();
}

class _CardTransState extends State<CardTrans> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PurchaseDetail(dataTransaksi: widget.x, type: widget.type),)
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
        ),
        padding: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${widget.x[0]}',style: TextStyle(fontSize: 16)),
                Text('${widget.x[1]}',style: TextStyle(fontSize: 16))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text('${widget.x[2]}',style: TextStyle(fontSize: 17), overflow: TextOverflow.ellipsis,)
                ),
                SizedBox(width: 20,),
                Text('User : ${widget.x[3]}',style: TextStyle(fontSize: 16))
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 7,bottom: 7),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 2, 
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total : ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                Text(
                  NumberFormat.currency(
                    locale: 'id_ID',
                    symbol: 'Rp. ',
                    decimalDigits: 2,
                  ).format(widget.x[5]),
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
              ],
            ),
          ],
        ),
      ),
    );
  }
}