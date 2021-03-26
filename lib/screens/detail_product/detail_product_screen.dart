import 'package:carousel_slider/carousel_slider.dart';
import 'package:cart_app/models/product_model.dart';
import 'package:cart_app/utils/widget_utils.dart';
import 'package:flutter/material.dart';

part 'package:cart_app/screens/detail_product/widget/carousel.dart';

part 'package:cart_app/screens/detail_product/widget/cart_counter_badge.dart';

part 'package:cart_app/screens/detail_product/widget/drawer.dart';

class DetailProductScreen extends StatelessWidget {
  final Products productModel;

  DetailProductScreen({Key key, this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text(
          "Detail Produk",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  );
                },
              ),
              _CartCounterBadge()
            ],
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Carousel(imgList: productModel.images),
                //Main description
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: Text(
                          "Rp ${WidgetUtil().formattedMoneyIDR(double.parse(productModel.price))}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(productModel.name),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                //Product Information
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Informasi Produk",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Kategori", style: TextStyle(fontSize: 16)),
                            Text(productModel.category,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Garansi", style: TextStyle(fontSize: 16)),
                            Text(productModel.wName,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Stok", style: TextStyle(fontSize: 16)),
                            Text(productModel.stock,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Peringkat", style: TextStyle(fontSize: 16)),
                            Text(productModel.rating,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54)),
                          ],
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deskripsi Produk",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 12),
                        Text(productModel.description,
                            style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 74,
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    new BoxShadow(
                        color: Colors.grey,
                        offset: new Offset(0.0, 10.0),
                        blurRadius: 40)
                  ],
                ),
                width: double.infinity,
                height: 60,
                child: ButtonTheme(
                  minWidth: 40.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  height: 40.0,
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    decoration: BoxDecoration(
                      border: new Border.all(
                          color: Colors.grey,
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      disabledColor: Colors.white,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_shopping_cart_sharp),
                          SizedBox(width: 8),
                          Text("Tambah ke keranjang",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
      endDrawer: _CartDrawer(),
    );
  }
}
