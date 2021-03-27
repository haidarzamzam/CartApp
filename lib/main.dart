import 'package:cart_app/bloc/cart/bloc.dart';
import 'package:cart_app/bloc/product/bloc.dart';
import 'package:cart_app/screens/product/product_screen.dart';
import 'package:cart_app/utils/end_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'app.dart';

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  App.configure(apiBaseURL: Endpoint.baseURL, appTitle: 'Github App');

  await App().init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
            create: (BuildContext context) => ProductBloc()),
        BlocProvider<CartBloc>(create: (BuildContext context) => CartBloc()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProductScreen(),
      ),
    );
  }
}
