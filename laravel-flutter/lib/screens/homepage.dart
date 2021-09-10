import 'dart:convert';

import 'package:belajar_flutter/screens/productdetail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  // const HomePage({
  //   Key key,
  // }) : super(key: key);
  static get list => null;

  // var url = Uri.parse('http://127.0.0.1:8000/api/product');
  var url = Uri.parse('http://10.0.2.2:8000/api/product');

  Future getProducts() async {
    var response = await http.get(url);
    // print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    // getProducts();
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Get HTTP')),
        ),
        body: FutureBuilder(
          future: getProducts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: snapshot.data['data'].length,
                  itemBuilder: (context, index) {
                    // field price to string
                    // int price = snapshot.data['data'][index]['price'];
                    // String priceString = price.toString();
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetail(
                                      product: snapshot.data['data'][index],
                                    )));
                      },
                      child: Container(
                          margin:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: ListTile(
                            leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    'https://source.unsplash.com/random')),
                            title: Text(snapshot.data['data'][index]['name']),
                            subtitle: Text('By ' +
                                snapshot.data['data'][index]['merchant'] +
                                ' -- Price : ' +
                                NumberFormat.currency(name: 'Rp. ').format(
                                    snapshot.data['data'][index]['price'])),
                            trailing: Icon(Icons.remove_red_eye_outlined),
                          )),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
