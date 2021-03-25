import 'dart:convert';

import 'package:cart_app/bloc/product/product_cubit.dart';
import 'package:cart_app/bloc/product/product_state.dart';
import 'package:cart_app/models/product_model.dart';
import 'package:cart_app/screens/detail_product/detail_product_screen.dart';
import 'package:cart_app/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'package:cart_app/screens/product/widget/item_product.dart';

class ProductScreen extends StatelessWidget {
  final _productCubit = ProductCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Product",
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
        body: BlocProvider<ProductCubit>(
          create: (context) => _productCubit,
          child: BlocListener<ProductCubit, ProductState>(
              listener: (context, state) {
                if (state is LoadingProductState) {
                } else if (state is SuccessProductState) {
                  Get.snackbar('Information', 'Success Get Data');
                } else if (state is FailureProductState) {
                  Get.snackbar('Information', 'Failure Get Data');
                }
              },
              child: FutureBuilder<ProductModel>(
                  future: _productCubit.getDataProduct(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.products.length > 0) {
                        return GridView.builder(
                          itemCount: snapshot.data.products.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200.0,
                                  childAspectRatio: 0.9),
                          itemBuilder: (context, index) {
                            List<dynamic> dataImage =
                                jsonDecode(snapshot.data.products[index].image);
                            return GestureDetector(
                              onTap: () => Get.to(DetailProductScreen(
                                productModel: snapshot.data.products[index],
                              )),
                              child: _ItemProduct(
                                name: snapshot.data.products[index].name,
                                image: dataImage[0]['url'],
                                price: double.parse(
                                    snapshot.data.products[index].price),
                              ),
                            );
                          },
                        );
                      }
                      return Center(child: Text("Tidak ada data"));
                    }
                    return Center(child: CircularProgressIndicator());
                  })),
        ));
  }
}
