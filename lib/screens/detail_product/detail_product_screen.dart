import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cart_app/bloc/cart/bloc.dart';
import 'package:cart_app/models/cart_model.dart';
import 'package:cart_app/models/product_model.dart';
import 'package:cart_app/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

part 'package:cart_app/screens/detail_product/widget/carousel.dart';

part 'package:cart_app/screens/detail_product/widget/cart_counter_badge.dart';

part 'package:cart_app/screens/detail_product/widget/container_bottom.dart';

part 'package:cart_app/screens/detail_product/widget/container_description.dart';

part 'package:cart_app/screens/detail_product/widget/container_information.dart';

part 'package:cart_app/screens/detail_product/widget/container_main.dart';

part 'package:cart_app/screens/detail_product/widget/drawer.dart';

class DetailProductScreen extends StatefulWidget {
  final Products productModel;

  DetailProductScreen({Key key, this.productModel}) : super(key: key);

  @override
  _DetailProductScreenState createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  Products _productModel;
  List<CartModel> _cartModel = [];

  CartBloc _cartBloc;

  @override
  void initState() {
    super.initState();
    _productModel = widget.productModel;
    _cartBloc = BlocProvider.of<CartBloc>(context);
    _cartBloc.add(GetCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _cartBloc,
      listener: (context, state) {
        if (state is GetCartState) {
          _cartModel = state.data;
        } else if (state is AddCartState) {
          final tile = state.data.firstWhere((item) => item.id == state.id);
          Get.snackbar(
              "Informasi", "Sukses menambahkan ke keranjang : ${tile.title}");
          _cartModel = state.data;
        } else if (state is RemoveCartState) {
          Get.snackbar("Informasi", "Berhasil menghapus ${state.title}");
        }
      },
      child: BlocBuilder(
          bloc: _cartBloc,
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.grey.shade200,
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
                            onPressed: () =>
                                Scaffold.of(context).openEndDrawer(),
                          );
                        },
                      ),
                      _CartCounterBadge(
                        cartCount: _cartModel.length,
                      )
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
                        _Carousel(imgList: _productModel.images),
                        _ContainerMain(productModel: _productModel),
                        SizedBox(
                          height: 12,
                        ),
                        _ContainerInformation(productModel: _productModel),
                        SizedBox(
                          height: 12,
                        ),
                        _ContainerDescription(productModel: _productModel),
                        SizedBox(
                          height: 74,
                        )
                      ],
                    ),
                  ),
                  _ContainerBottom(
                      cartBloc: _cartBloc, productModel: _productModel)
                ],
              ),
              endDrawer: _CartDrawer(data: _cartModel, cartBloc: _cartBloc),
            );
          }),
    );
  }
}
