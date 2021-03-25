import 'package:intl/intl.dart';

class WidgetUtil {
  String formattedMoneyIDR(double money) {
    return NumberFormat("###,###,###", "id_id").format(money ?? 0);
  }
}
