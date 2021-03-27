part of 'package:cart_app/screens/detail_product/detail_product_screen.dart';

class _ContainerMain extends StatelessWidget {
  final Products productModel;

  const _ContainerMain({Key key, this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Text(
              "Rp ${WidgetUtil().formattedMoneyIDR(double.parse(productModel.price))}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(productModel.name),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
