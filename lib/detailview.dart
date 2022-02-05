import 'package:crud_flutter/myhomepage.dart';
import 'package:crud_flutter/services/databaseHelper.dart';
import 'package:crud_flutter/viewdata.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  List? list;
  int index;
  DetailPage({
    Key? key,
    this.list,
    required this.index,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DatabaseHelper _dbhelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Detail Product - ${widget.list![widget.index]['nm_product'].toString()}'),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.only(
            top: 62,
            right: 12.0,
            left: 12.0,
            bottom: 12.0,
          ),
          children: [
            Container(
              height: 50.0,
              child: Text(
                "Nama Product : ${widget.list![widget.index]['nm_product']}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 50.0,
              child: Text(
                "Price : ${widget.list![widget.index]['price']}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 50.0,
              child: Text(
                "Stok : ${widget.list![widget.index]['stok']}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                  ),
                  onPressed: () {
                    _dbhelper.DeleteData(widget.list![widget.index]['id']);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ),
                    );
                  },
                  child: Text('Delete'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                  ),
                  onPressed: () {
                    _dbhelper.EditData(widget.list![widget.index]['id']);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (contex) => ViewData(
                        list: widget.list,
                        index: widget.index,
                      ),
                    ));
                  },
                  child: Text('View'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
