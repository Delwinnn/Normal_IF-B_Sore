import 'package:Stockify/AboutPage.dart';
import 'package:Stockify/PurchasingPage.dart';
import 'package:Stockify/SalesPage.dart';
import 'package:Stockify/StockPage.dart';
import 'package:Stockify/homePage.dart';
import 'package:Stockify/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
  List<Widget> halaman = [
    StockView(), PurchasingView(), HomeView(data: Provider.of<ProviderGudang>(context).Gudang , user: Provider.of<ProviderGudang>(context).Gudang.usinguser), SalesView(), AboutView()
  ];
  int current = Provider.of<BottomNav>(context).currentpage;
    return Scaffold(
      body: halaman[current],
      bottomNavigationBar: BottomNavBar(
        onTap: (int val){
          setState(() {
            Provider.of<BottomNav>(context,listen: false).goPage(val);
          });
        }
      )
    );
  }
}


class BottomNavBar extends StatelessWidget {
  final Function(int) onTap;

  const BottomNavBar({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.white,
      color: Colors.blue,
      buttonBackgroundColor: Colors.blue,
      onTap: onTap,
       items: <Widget>[
        Icon(Icons.warehouse, size: 30, color: Colors.white),
        Icon(Icons.attach_money, size: 30, color: Colors.white),
        Icon(Icons.house_sharp, size: 30, color: Colors.white),
        Icon(Icons.sell, size: 30, color: Colors.white),
        Icon(Icons.info, size: 30, color: Colors.white), 
    ],
      index: Provider.of<BottomNav>(context).currentpage,
    );
  }
}