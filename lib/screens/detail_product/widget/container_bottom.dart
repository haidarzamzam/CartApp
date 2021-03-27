part of 'package:cart_app/screens/detail_product/detail_product_screen.dart';

class _ContainerBottom extends StatelessWidget {
  final CartBloc cartBloc;
  final Products productModel;

  const _ContainerBottom({Key key, this.cartBloc, this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textFields = <Padding>[];
    Map<String, TextEditingController> textEditingControllers = {};
    productModel.variantGroups.forEach((item) {
      if (item.isRequired == "1") {
        var textEditingController = new TextEditingController();
        textEditingControllers.putIfAbsent(
            item.name, () => textEditingController);
        return textFields.add(Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TextField(
              enableSuggestions: false,
              autocorrect: false,
              autofocus: false,
              decoration: WidgetUtil().roundedFormField(
                borderSideColor: Colors.transparent,
                fillColor: Colors.grey.shade200,
                hintText: item.name + " (Wajib)",
              ),
              controller: textEditingController),
        ));
      } else {
        var textEditingController = new TextEditingController();
        textEditingControllers.putIfAbsent(
            item.name, () => textEditingController);
        return textFields.add(Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TextField(
              enableSuggestions: false,
              autocorrect: false,
              autofocus: false,
              decoration: WidgetUtil().roundedFormField(
                borderSideColor: Colors.transparent,
                fillColor: Colors.grey.shade200,
                hintText: item.name + " (Opstional)",
              ),
              controller: textEditingController),
        ));
      }
    });

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
                  if (productModel.isVariant == "1") {
                    Get.bottomSheet(Container(
                      height: 300,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView(
                          children: [
                            Column(children: textFields),
                            ButtonTheme(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              height: 40.0,
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  border: new Border.all(
                                      color: Colors.grey,
                                      width: 2.0,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.white,
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    List<String> _variant = [];
                                    bool _isCompleted = false;
                                    productModel.variantGroups.forEach((item) {
                                      if (item.isRequired == "1") {
                                        if (textEditingControllers[item.name]
                                            .text
                                            .isEmpty) {
                                          Get.snackbar("Informasi",
                                              "${item.name} Harus di isi",
                                              backgroundColor: Colors.red);
                                          _isCompleted = false;
                                        } else {
                                          _variant.add(
                                              "${item.name} ${textEditingControllers[item.name].text}");
                                          _isCompleted = true;
                                        }
                                      } else if (item.isRequired == "0") {
                                        if (textEditingControllers[item.name]
                                            .text
                                            .isNotEmpty) {
                                          _variant.add(
                                              "${item.name} ${textEditingControllers[item.name].text}");
                                        }
                                      }
                                    });

                                    if (_isCompleted) {
                                      cartBloc.add(AddCartEvent(
                                          data: CartModel(
                                              id: productModel.id +
                                                  _variant.toString(),
                                              title: productModel.name,
                                              price: double.parse(
                                                  productModel.price),
                                              image: productModel.image,
                                              quantity: 1,
                                              variant: _variant)));
                                      Get.back();
                                    }
                                  },
                                  disabledColor: Colors.white,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add_shopping_cart_sharp),
                                      SizedBox(width: 8),
                                      Text("Tambahkan ke keranjang",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
                  } else {
                    cartBloc.add(AddCartEvent(
                        data: CartModel(
                            id: productModel.id,
                            title: productModel.name,
                            price: double.parse(productModel.price),
                            image: productModel.image,
                            quantity: 1,
                            variant: [])));
                  }
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
