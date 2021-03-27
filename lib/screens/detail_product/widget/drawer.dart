part of 'package:cart_app/screens/detail_product/detail_product_screen.dart';

class _CartDrawer extends StatelessWidget {
  final List<CartModel> data;
  final CartBloc cartBloc;

  _CartDrawer({Key key, this.data, this.cartBloc}) : super(key: key);

  final qtyTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double total = 0;
    data.forEach((item) {
      total += item.price * item.quantity;
    });
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 85,
            child: DrawerHeader(
                padding: EdgeInsets.zero,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.shopping_cart),
                      Text(
                        "Rp ${WidgetUtil().formattedMoneyIDR(total)}",
                      )
                    ],
                  ),
                )),
          ),
          Expanded(
            child: data.isEmpty
                ? Center(child: Text("Tidak ada barang"))
                : ListView.builder(
                itemCount: data.length ?? 0,
                itemBuilder: (context, index) {
                  List<dynamic> dataImage = jsonDecode(data[index].image);
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: Container(
                      color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    dataImage[0]['url'],
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[index].title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                            "Rp ${WidgetUtil().formattedMoneyIDR(data[index].price)}")
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: Center(
                                      child: Text(
                                        "x${data[index].quantity}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Visibility(
                                visible: data[index].variant.isNotEmpty,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, left: 8.0),
                                  child: Text(
                                    "Varian :",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: ListView.builder(
                                    itemCount: data[index].variant.length,
                                    physics: ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, indexChild) {
                                      return Text(
                                          data[index].variant[indexChild]);
                                    }),
                              ),
                              SizedBox(height: 8)
                            ],
                          ),
                        ),
                    secondaryActions: <Widget>[
                      IconSlideAction(

                        caption: 'Ubah',
                        color: Colors.blue,
                        icon: Icons.edit,
                        onTap: () =>
                            Get.dialog(AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                        enableSuggestions: false,
                                        autocorrect: false,
                                        autofocus: false,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: WidgetUtil()
                                            .roundedFormField(
                                          borderSideColor: Colors.transparent,
                                          fillColor: Colors.grey.shade200,
                                          hintText: "Qty",
                                        ),
                                        controller: qtyTextEditingController
                                          ..text = data[index].quantity
                                              .toString()),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    RaisedButton(
                                      child: Text('Edit Qty'),
                                      onPressed: () {
                                        if (qtyTextEditingController.text
                                            .isEmpty ||
                                            qtyTextEditingController.text ==
                                                "0") {
                                          Get.snackbar(
                                              "Informasi",
                                              "Tidak boleh kosong");
                                        } else {
                                          cartBloc.add(EditCartEvent(
                                              id: data[index].id,
                                              qty: int.parse(
                                                  qtyTextEditingController
                                                      .text),
                                              title: data[index].title));
                                          Get.back();
                                        }
                                      },
                                    ),
                                  ],
                                ))),
                      ),
                      IconSlideAction(
                        caption: 'Hapus',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () =>
                            cartBloc
                                .add(RemoveCartEvent(data: data[index])),
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
