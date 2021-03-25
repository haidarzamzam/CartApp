import 'package:cart_app/bloc/product/product_state.dart';
import 'package:cart_app/models/product_model.dart';
import 'package:cart_app/services/product_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(InitialProductState());

  Future<ProductModel> getDataProduct() async {
    try {
      emit(LoadingProductState());
      final ProductModel data = await getAllProductModel();
      emit(SuccessProductState(data));
      return data;
    } on PlatformException catch (e) {
      emit(FailureProductState(e.message));
    }
    return null;
  }
}
