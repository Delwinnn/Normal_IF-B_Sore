import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  String name;
  HistoryPage({super.key,required this.name});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Page'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child:  Text("${_selectedIndex==0 ? "Purchase" : "Sales"} History",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
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