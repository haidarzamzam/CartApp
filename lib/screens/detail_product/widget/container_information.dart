part of 'package:cart_app/screens/detail_product/detail_product_screen.dart';

class _ContainerInformation extends StatelessWidget {
  final Products productModel;

  const _ContainerInformation({Key key, this.productModel}) : super(key: key);

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
              "Informasi Produk",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Kategori", style: TextStyle(fontSize: 16)),
                Text(productModel.category,
                    style: TextStyle(fontSize: 16, color: Colors.black54)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Garansi", style: TextStyle(fontSize: 16)),
                Text(productModel.wName,
                    style: TextStyle(fontSize: 16, color: Colors.black54)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Stok", style: TextStyle(fontSize: 16)),
                Text(productModel.stock,
                    style: TextStyle(fontSize: 16, color: Colors.black54)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Peringkat", style: TextStyle(fontSize: 16)),
                Text(productModel.rating,
                    style: TextStyle(fontSize: 16, color: Colors.black54)),
              ],
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
