part of 'package:cart_app/screens/detail_product/detail_product_screen.dart';

class _CartDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 110,
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
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Text("$index");
                }),
          )
        ],
      ),
    );
  }
}
