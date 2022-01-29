import 'dart:convert';

import 'package:crud_flutter/services/databaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crud_flutter/detailview.dart';
import 'package:crud_flutter/addpage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DatabaseHelper _dbhelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD API'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (contex) => AddPage(),
          ));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: FutureBuilder<List>(
        future: _dbhelper.getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          //tampilan widget
          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  List? list;
  ItemList({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (contex) => DetailPage(
                  list: list,
                  index: index,
                ),
              ));
            },
            child: Card(
              child: ListTile(
                title: Text(list![index]['nm_product']),
                leading: Icon(Icons.widgets),
                //subtitle: Text(list![index]['id'].toString()),
                subtitle: Text('Stock : ${list![index]['stok']}'),
              ),
            ),
          );
        });
  }
}
