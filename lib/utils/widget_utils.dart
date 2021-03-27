import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WidgetUtil {
  String formattedMoneyIDR(double money) {
    return NumberFormat("###,###,###", "id_id").format(money ?? 0);
  }

  InputDecoration roundedFormField({
    Widget prefixIcon,
    Widget suffixIcon,
    Color fillColor,
    Color borderSideColor,
    double radius = 10.0,
    String hintText,
    double contentPadding = 15.0,
  }) {
    final decoration = InputDecoration(
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: fillColor ?? Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        borderSide: BorderSide(
          color: borderSideColor ?? Color(0xFF000000),
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        borderSide: BorderSide(
          color: borderSideColor ?? Color(0xFF000000),
          width: 2,
        ),
      ),
      contentPadding: EdgeInsets.all(contentPadding),
      hintText: hintText,
    );

    return decoration;
  }
}
