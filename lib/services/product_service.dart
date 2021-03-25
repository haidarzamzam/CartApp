import 'package:cart_app/app.dart';
import 'package:cart_app/models/product_model.dart';
import 'package:cart_app/utils/end_point.dart';
import 'package:dio/dio.dart';

Dio _dio = App().dio;

// ignore: missing_return
Future<ProductModel> getAllProductModel() async {
  Response response = await _dio.get(Endpoint.getAllData);

  if (response.statusCode == 200) {
    print(response.data);
    return ProductModel.fromJson(response.data);
  }
}
