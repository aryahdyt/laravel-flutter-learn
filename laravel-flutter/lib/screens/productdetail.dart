import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductDetail extends StatelessWidget {
  final Map product;

  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    // int price = product['price'];
    // String priceString = price.toString();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Product detail ' + product['name']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.only(top: 20, right: 20, left: 20),
              child: Container(
                child:
                    Image.network('https://source.unsplash.com/random/800x800'),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Card(
              margin: EdgeInsets.only(right: 20, left: 20),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Price :',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          NumberFormat.currency(name: 'Rp. ')
                              .format(product['price']),
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.favorite_border_outlined),
                        Icon(Icons.delete_outline_outlined),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
