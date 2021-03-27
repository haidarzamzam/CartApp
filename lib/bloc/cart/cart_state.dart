import 'package:cart_app/models/cart_model.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class GetCartState extends CartState {
  final List<CartModel> data;

  GetCartState({this.data});
}

class AddCartState extends CartState {
  final List<CartModel> data;
  final String id;

  AddCartState({this.data, this.id});
}

class EditCartState extends CartState {
  final String title;

  EditCartState({this.title});
}

class RemoveCartState extends CartState {
  final String title;

  RemoveCartState({this.title});
}
