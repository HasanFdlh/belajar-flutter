import 'package:crud_flutter/myhomepage.dart';
import 'package:crud_flutter/services/databaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AddPage extends StatefulWidget {
  AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  DatabaseHelper _dbHelper = DatabaseHelper();
  TextEditingController _itemName = TextEditingController();
  TextEditingController _itemPrice = TextEditingController();
  TextEditingController _itemStock = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text('Create Product'),
      ),
      body: ListView(
        padding: EdgeInsets.only(right: 10.0, left: 10.0),
        children: [
          Column(
            children: [
              TextField(
                controller: _itemName,
                decoration: InputDecoration(
                  hintText: 'Item Name',
                  labelText: 'Item Name',
                ),
              ),
              TextField(
                controller: _itemPrice,
                decoration: InputDecoration(
                  hintText: 'Price',
                  labelText: 'Price',
                ),
              ),
              TextField(
                controller: _itemStock,
                decoration: InputDecoration(
                  hintText: 'Stock',
                  labelText: 'Stock',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                onPressed: () {
                  _dbHelper.AddData(_itemName.text.trim(),
                      _itemPrice.text.trim(), _itemStock.text.trim());
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (contex) => MyHomePage(),
                  ));
                },
                child: Text('Simpan'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
