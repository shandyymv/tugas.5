import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Page 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Page1(),
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  TextEditingController kodeController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController satuanController = TextEditingController();
  TextEditingController hargaJualController = TextEditingController();
  TextEditingController hargaBeliController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: kodeController,
              decoration: InputDecoration(labelText: 'Kode Barang'),
            ),
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama Barang'),
            ),
            TextField(
              controller: satuanController,
              decoration: InputDecoration(labelText: 'Satuan Barang'),
            ),
            TextField(
              controller: hargaJualController,
              decoration: InputDecoration(labelText: 'Harga Jual'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: hargaBeliController,
              decoration: InputDecoration(labelText: 'Harga Beli'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implementasi logika untuk menyimpan data
                // dan berpindah ke Page 2
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page2(
                    kode: kodeController.text,
                    nama: namaController.text,
                    satuan: satuanController.text,
                    hargaJual: hargaJualController.text,
                    hargaBeli: hargaBeliController.text,
                  )),
                );
              },
              child: Text('Save'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implementasi logika untuk membatalkan dan kembali
                // ke halaman sebelumnya atau melakukan reset
                kodeController.clear();
                namaController.clear();
                satuanController.clear();
                hargaJualController.clear();
                hargaBeliController.clear();
              },
              child: Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
class Page2 extends StatelessWidget {
  final String kode;
  final String nama;
  final String satuan;
  final String hargaJual;
  final String hargaBeli;

  Page2({
    required this.kode,
    required this.nama,
    required this.satuan,
    required this.hargaJual,
    required this.hargaBeli,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Kode Barang: $kode'),
            Text('Nama Barang: $nama'),
            Text('Satuan Barang: $satuan'),
            Text('Harga Jual: $hargaJual'),
            Text('Harga Beli: $hargaBeli'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}