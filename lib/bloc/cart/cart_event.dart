import 'package:cart_app/models/cart_model.dart';
import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetCartEvent extends CartEvent {
  final CartModel data;

  GetCartEvent({this.data});

  @override
  String toString() => 'GetCartEvent';
}

class AddCartEvent extends CartEvent {
  final CartModel data;

  AddCartEvent({this.data});

  @override
  String toString() => 'AddCartEvent';
}

class RemoveCartEvent extends CartEvent {
  final CartModel data;

  RemoveCartEvent({this.data});

  @override
  String toString() => 'RemoveCartEvent';
}
