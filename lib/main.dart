import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/service/api_service.dart';
import 'package:my_store/view/screens/category_screen.dart';
import 'package:my_store/view/screens/dashboard_screen.dart';
import 'package:my_store/view/screens/my_favourite_screen.dart';
import 'package:my_store/view/screens/product_detail_screen.dart';
import 'package:my_store/view/screens/products_screen.dart';
import 'package:my_store/view/screens/profile_screen.dart';
import 'package:my_store/view/screens/selected_category_screen.dart';
import 'package:my_store/view/screens/splash_screen.dart';

import 'model/product_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (_, child)
      {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My Store',
          home: SplashScreen(),
        );
      },
    );
  }
}

