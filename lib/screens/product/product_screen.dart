import 'dart:convert';

import 'package:cart_app/bloc/product/bloc.dart';
import 'package:cart_app/models/product_model.dart';
import 'package:cart_app/screens/detail_product/detail_product_screen.dart';
import 'package:cart_app/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

part 'package:cart_app/screens/product/widget/item_product.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductBloc _productBloc;
  ProductModel _productModel;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _productBloc = BlocProvider.of<ProductBloc>(context);
    _productBloc.add(GetProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _productBloc,
      listener: (context, state) {
        if (state is GetDataProductSuccessState) {
          _isLoading = false;
          _productModel = state.data;
          Get.snackbar("Informasi", "Get Data Berhasil");
        } else if (state is GetDataProductFailureState) {
          _isLoading = false;
          Get.snackbar("Informasi", "Get Data Gagal");
        }
      },
      child: BlocBuilder(
          bloc: _productBloc,
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(
                    "Daftar Produk",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.white,
                  centerTitle: true,
                ),
                body: !_isLoading
                    ? LoadingOverlay(
                        isLoading: _isLoading,
                        child: GridView.builder(
                          itemCount: _productModel.products.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200.0,
                                  childAspectRatio: 0.9),
                          itemBuilder: (context, index) {
                            List<dynamic> dataImage =
                                jsonDecode(_productModel.products[index].image);
                            return GestureDetector(
                              onTap: () => Get.to(
                                DetailProductScreen(
                                  productModel: _productModel.products[index],
                                ),
                              ),
                              child: _ItemProduct(
                                name: _productModel.products[index].name,
                                image: dataImage[0]['url'],
                                price: double.parse(
                                    _productModel.products[index].price),
                              ),
                            );
                          },
                        ),
                      )
                    : LoadingOverlay(
                        isLoading: _isLoading,
                        child: Container(
                          color: Colors.white,
                        ),
                      ));
          }),
    );
  }
}
