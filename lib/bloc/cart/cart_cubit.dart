import 'package:cart_app/bloc/cart/cart_state.dart';
import 'package:cart_app/models/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<CartState> {
  ProductCubit() : super(InitialCartState());

  Map<String, CartModel> _items = {};

  Map<String, CartModel> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cart) => total += cart.price * cart.quantity);
    return total;
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (old) => CartModel(
          id: old.id,
          title: old.title,
          price: old.price,
          quantity: old.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartModel(
          id: productId,
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
  }

  void removeItem(String productId) {
    _items.remove(productId);
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) return;
    if (_items[productId].quantity > 1) {
      _items.update(
          productId,
          (old) => CartModel(
                id: old.id,
                title: old.title,
                price: old.price,
                quantity: old.quantity - 1,
              ));
    } else {
      _items.remove(productId);
    }
  }

  void clear() {
    _items = {};
  }
}
