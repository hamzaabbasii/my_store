import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h,),
            Center(
              child: Text('Mitt konto', style: GoogleFonts.playfairDisplay(
                fontSize: 35.sp,
                fontWeight: FontWeight.w500,
              ),),
            ),
            SizedBox(height: 10.h,),
            Container(
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5.r)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: CircleAvatar(radius: 43.r, backgroundColor: Colors.white,)),
                  SizedBox(width: 15.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h,),
                      Text('Hamza Majeed', style: GoogleFonts.poppins(color: Colors.white, fontSize: 16.sp ),),
                      Text('mystore@gmail.com', style: GoogleFonts.poppins(color: Colors.white, fontSize: 12.sp ),),
                      Text('0337878788', style: GoogleFonts.poppins(color: Colors.white, fontSize: 12.sp),),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height:50.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: Icon(Icons.settings_outlined, color: Colors.black,)),
                SizedBox(width:15.w ,),
                Text('Kontoinstallningar', style: GoogleFonts.poppins(fontSize: 15.spMax),),
              ],
            ),
            SizedBox(height:20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: Icon(Icons.indeterminate_check_box_rounded, color: Colors.black,)),
                SizedBox(width:15.w ,),
                Text('Mina betalmetoder', style: GoogleFonts.poppins(fontSize: 15.spMax),),
              ],
            ),
            SizedBox(height:20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: Icon(Icons.support, color: Colors.black,)),
                SizedBox(width:15.w ,),
                Text('Support', style: GoogleFonts.poppins(fontSize: 15.spMax),),
              ],
            ),

          ],
        ),
      ),
    );
  }
}