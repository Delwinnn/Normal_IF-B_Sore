import 'package:agile_git/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListItem extends StatelessWidget {
  final List data;
  const ListItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    List allproduct = Provider.of<ProviderGudang>(context,listen: false).Gudang.product;
    List onlyname = allproduct.map((e) => e[1]).toList();
    int indexproduct = onlyname.indexOf(data[0]);
    return Row( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: allproduct[indexproduct][0]
        ),
        Expanded(
          child: Container(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${data[0]}",
                  style: TextStyle(fontSize: 16), maxLines: 2,overflow: TextOverflow.ellipsis,
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: 'Rp. ',
                        decimalDigits: 0,
                      ).format(data[1]),
                      style: TextStyle(fontSize: 15)),
                    Text("${data[2]}x")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: 'Rp. ',
                        decimalDigits: 2,
                      ).format(data[1]*data[2]),
                      style: TextStyle(fontSize: 15))
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

