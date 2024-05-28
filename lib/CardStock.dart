import 'package:agile_git/ProductDetail.dart';
import 'package:flutter/material.dart';

class CardStock extends StatelessWidget {
  final dynamic produk;
  const CardStock({super.key,required this.produk});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => InfoProduct(data: produk,))
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
        ),
        padding: EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 90,
              height: 90,
              child: produk[0],
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text("${produk[1]}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),maxLines: 2,overflow: TextOverflow.ellipsis),
                      Text("${produk[2]}",style: TextStyle(fontSize: 13,color: Colors.grey[600])),
                    ]),
                  Text('Stock : ${produk[3]}',style: TextStyle(fontSize: 16)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}