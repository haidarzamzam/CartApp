part of 'package:cart_app/screens/detail_product/detail_product_screen.dart';

class _ContainerDescription extends StatelessWidget {
  final Products productModel;

  const _ContainerDescription({Key key, this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Deskripsi Produk",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(productModel.description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
