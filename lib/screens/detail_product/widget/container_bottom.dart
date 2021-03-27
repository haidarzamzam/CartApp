part of 'package:cart_app/screens/detail_product/detail_product_screen.dart';

class _ContainerBottom extends StatelessWidget {
  final CartBloc cartBloc;
  final Products productModel;

  const _ContainerBottom({Key key, this.cartBloc, this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              new BoxShadow(
                  color: Colors.grey,
                  offset: new Offset(0.0, 10.0),
                  blurRadius: 40)
            ],
          ),
          width: double.infinity,
          height: 60,
          child: ButtonTheme(
            minWidth: 40.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            height: 40.0,
            child: Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              decoration: BoxDecoration(
                border: new Border.all(
                    color: Colors.grey, width: 2.0, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              child: MaterialButton(
                onPressed: () {
                  cartBloc.add(AddCartEvent(
                      data: CartModel(
                          id: productModel.id,
                          title: productModel.name,
                          price: double.parse(productModel.price),
                          image: productModel.image,
                          quantity: 1,
                          variant: "")));
                },
                disabledColor: Colors.white,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_shopping_cart_sharp),
                    SizedBox(width: 8),
                    Text("Tambahkan ke keranjang",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
