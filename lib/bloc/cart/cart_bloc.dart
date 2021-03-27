import 'dart:async';

import 'package:cart_app/bloc/cart/bloc.dart';
import 'package:cart_app/models/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  @override
  CartState get initialState => CartInitial();

  var cart = new List<CartModel>();

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is GetCartEvent) {
      yield* _getCart(event);
    } else if (event is AddCartEvent) {
      yield* _addCart(event);
    } else if (event is RemoveCartEvent) {
      yield* _removeCart(event);
    } else if (event is EditCartEvent) {
      yield* _editCart(event);
    }
  }

  Stream<CartState> _getCart(GetCartEvent event) async* {
    yield CartInitial();

    yield GetCartState(data: cart);
  }

  Stream<CartState> _addCart(AddCartEvent event) async* {
    yield CartInitial();

    var contain = cart.where((item) =>
        item.id == event.data.id || item.variant == event.data.variant);

    if (contain.isEmpty) {
      cart.add(event.data);
    } else {
      final tile = cart.firstWhere((item) => item.id == event.data.id);
      tile.quantity = tile.quantity + event.data.quantity;
    }

    yield AddCartState(data: cart, id: event.data.id);
  }

  Stream<CartState> _editCart(EditCartEvent event) async* {
    yield CartInitial();

    final tile = cart.firstWhere((item) => item.id == event.id);
    tile.quantity = event.qty;

    yield EditCartState(title: event.title);
  }

  Stream<CartState> _removeCart(RemoveCartEvent event) async* {
    yield CartInitial();

    cart.removeWhere((item) =>
        item.id == event.data.id && item.variant == event.data.variant);

    yield RemoveCartState(title: event.data.title);
  }
}
