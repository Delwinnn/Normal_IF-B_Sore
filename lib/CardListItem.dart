import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListItem extends StatelessWidget {
  final List data;
  const ListItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
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
          child: data[0]
        ),
        Expanded(
          child: Container(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${data[1]}",
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
                      ).format(data[2]),
                      style: TextStyle(fontSize: 15)),
                    Text("${data[3]}x")
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
                      ).format(data[2]*data[3]),
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

