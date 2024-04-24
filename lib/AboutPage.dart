import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About',
          style: TextStyle(color: Colors.white, ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue, 
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            Center(
              child: Text(
                "Selamat Datang di Bagian About dari Aplikasi Stok Gudang",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Dikembangkan bersama oleh:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text('Kelompok Normal beranggotakan : ', textAlign: TextAlign.center),
            Text('Delwin - 221110202', textAlign: TextAlign.center),
            Text('Richard - 221111467', textAlign: TextAlign.center),
            Text('Charlie - 221110844', textAlign: TextAlign.center),
            Text('Gilbert GW - 221111169', textAlign: TextAlign.center),
            SizedBox(height: 20),
            Text(
              'About Aplikasi Stok Gudang',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Aplikasi Stok Gudang bertujuan mencatat:\n\n'
              'Pembelian Barang dari Perusahaan lain\n\n'
              'Penjualan Barang untuk Perusahaan lain\n\n'
              'Serta tujuan utamanya untuk mengecek Stok dalam Gudang\n\n'
              'Aplikasi Stok Gudang didevelop sepenuh hati oleh Kelompok Normal '
              ''
              ,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}