part of 'package:cart_app/screens/detail_product/detail_product_screen.dart';

class _CartDrawer extends StatelessWidget {
  final List<CartModel> data;
  final CartBloc cartBloc;

  const _CartDrawer({Key key, this.data, this.cartBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        'Keranjang',
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
                          child: Row(
                            children: [
                              Image.network(
                                dataImage[0]['url'],
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption: 'Hapus',
                            color: Colors.blue,
                            icon: Icons.delete,
                            onTap: () => cartBloc
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
