part of 'package:cart_app/screens/detail_product/detail_product_screen.dart';

class _CartCounterBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 5,
      top: 5,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        constraints: const BoxConstraints(
          minWidth: 18,
          minHeight: 18,
        ),
        child: Text(
          "-",
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
