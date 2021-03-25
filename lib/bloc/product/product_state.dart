import 'package:cart_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialProductState extends ProductState {}

class LoadingProductState extends ProductState {}

class SuccessProductState extends ProductState {
  final ProductModel data;

  SuccessProductState(this.data);

  @override
  List<Object> get props => [data];

  @override
  String toString() {
    return 'SuccessProductState{errorMessage: $data}';
  }
}

class FailureProductState extends ProductState {
  final String errorMessage;

  FailureProductState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'FailureProductState{errorMessage: $errorMessage}';
  }
}
