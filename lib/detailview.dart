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
                  onPressed: () {},
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
