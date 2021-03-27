import 'dart:async';

import 'package:cart_app/models/product_model.dart';
import 'package:cart_app/services/product_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  @override
  ProductState get initialState => ProductInitial();

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is GetProductEvent) {
      yield* _getProduct(event);
    }
  }

  Stream<ProductState> _getProduct(GetProductEvent event) async* {
    yield ProductInitial();

    ProductModel response;
    try {
      response = await getAllProductModel();

      yield GetDataProductSuccessState(data: response);
    } catch (err) {
      yield GetDataProductFailureState(
          message: err?.response?.statusCode.toString());
    }
  }
}
