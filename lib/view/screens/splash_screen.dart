import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/view/screens/dashboard_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),  ()=> Get.to(DashboardScreen()) );
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_background.png'),
            fit: BoxFit.fill,
            opacity: 1,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.center,
          children: [
            SizedBox(height: 66.h),
            Text('My Store', style: GoogleFonts.playfairDisplay(
              fontWeight: FontWeight.w500,
              fontSize: 40.sp,
            ),),
            SizedBox(height: size.height * 0.4,),
            _textWidget('Valkommen', 18.sp, FontWeight.w500),
            SizedBox(height: 20.h,),
            Expanded(
              child: _textWidget('Hos ass kan du baka tid has nastan alla\nSveriges salonger och motagningar. Baka\nfrisor, massage, skonhetsbehandingar,\nfriskvard och mycket mer.', 14.sp, FontWeight.normal),

            ),
          ],
        ),
      ),
    );
  }

  Widget _textWidget(String text, double size, var fontWeight)
  {
    return Text(text, style: GoogleFonts.poppins(
      fontSize: size,
      fontWeight: fontWeight,
      color: Colors.white,
    ),);
  }
}
