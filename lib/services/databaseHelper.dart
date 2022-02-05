import 'dart:convert';

import 'package:http/http.dart' as http;

class DatabaseHelper {
  //function get data
  Future<List>? getData() async {
    var response =
        await http.get(Uri.parse('http://192.168.1.12:8000/api/product'));
    return jsonDecode(response.body)['data'];
  }

  void AddData(String nm_product, String price, String stok) {
    String myUrl = "http://192.168.1.12:8000/api/product";
    http.post(Uri.parse(myUrl), body: {
      "nm_product": "$nm_product",
      "price": "$price",
      "stok": "$stok"
    }).then((response) {
      print('Response status ${response.statusCode}');
      print('response body: ${response.body}');
    });
  }

  void DeleteData(int id) {
    String myUrl = "http://192.168.1.12:8000/api/product/$id";
    http.delete(Uri.parse(myUrl)).then((response) {
      print('Response status ${response.statusCode}');
      print('response body: ${response.body}');
    });
  }
}
