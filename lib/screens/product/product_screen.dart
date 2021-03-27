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
  List<Products> _productModel = List();
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
          _productModel = state.data.products;
          Get.snackbar("Informasi", "Get Data Produk Berhasil");
        } else if (state is GetDataProductFailureState) {
          _isLoading = false;
          Get.snackbar("Informasi", "Get Data Produk Gagal");
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
                      child: _productModel.isNotEmpty
                          ? GridView.builder(
                              itemCount: _productModel.length,
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200.0,
                                      childAspectRatio: 0.9),
                              itemBuilder: (context, index) {
                                List<dynamic> dataImage =
                                    jsonDecode(_productModel[index].image);
                                return GestureDetector(
                                  onTap: () => Get.to(
                                    DetailProductScreen(
                                      productModel: _productModel[index],
                                    ),
                                  ),
                                  child: _ItemProduct(
                                    name: _productModel[index].name,
                                    image: dataImage[0]['url'],
                                    price: double.parse(
                                        _productModel[index].price),
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: SizedBox(
                                width: 200,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                      onPressed: () {
                                        _productBloc.add(GetProductEvent());
                                      },
                                      disabledColor: Colors.white,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.refresh),
                                          SizedBox(width: 8),
                                          Text("Ulangi lagi",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    )
                  : LoadingOverlay(
                      isLoading: _isLoading,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
            );
          }),
    );
  }
}
