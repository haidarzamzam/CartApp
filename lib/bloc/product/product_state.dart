import 'package:cart_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class GetDataProductSuccessState extends ProductState {
  final ProductModel data;

  GetDataProductSuccessState({this.data});
}

class GetDataProductFailureState extends ProductState {
  final String message;

  GetDataProductFailureState({this.message});
}
