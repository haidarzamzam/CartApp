class CartModel {
  final String id;
  final String image;
  final String title;
  int quantity;
  final double price;
  final List<String> variant;

  CartModel(
      {this.id,
      this.image,
      this.title,
      this.price,
      this.quantity,
      this.variant});
}
