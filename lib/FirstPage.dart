import 'package:agile_git/AboutPage.dart';
import 'package:agile_git/PurchasingPage.dart';
import 'package:agile_git/SalesPage.dart';
import 'package:agile_git/StockPage.dart';
import 'package:agile_git/homePage.dart';
import 'package:agile_git/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
      items: const <BottomNavigationBarItem>[    
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.warehouse),
          label: 'Stock',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.attach_money),
          label: 'Purchasing',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.house_sharp),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.sell),
          label: 'Sales',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.info),
          label: 'About',
        ),
      ],
      currentIndex: Provider.of<BottomNav>(context).currentpage,
      onTap: onTap,
    );
  }
}
