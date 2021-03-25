import 'package:carousel_slider/carousel_slider.dart';
import 'package:cart_app/models/product_model.dart';
import 'package:flutter/material.dart';

part 'package:cart_app/screens/detail_product/widget/carousel.dart';

class DetailProductScreen extends StatelessWidget {
  final Products productModel;

  const DetailProductScreen({Key key, this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Product",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [_Carousel(imgList: productModel.images)],
        ),
      ),
    );
  }
}
