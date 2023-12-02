import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/view/screens/category_screen.dart';
import 'package:my_store/view/screens/my_favourite_screen.dart';
import 'package:my_store/view/screens/products_screen.dart';
import 'package:my_store/view/screens/profile_screen.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _index =0;
  void onTap(int index)
  {
    setState(() {
      _index = index;
    });
  }
  static  List<Widget> _listOptions=[
    ProductsScreen(),
    CategoryScreen(),
    MyFavouriteScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listOptions.elementAt(_index),
      bottomNavigationBar: Container(
        height: 70.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),),),
        child: BottomNavigationBar(
          currentIndex: _index,
          type: BottomNavigationBarType.fixed,
          onTap: onTap,
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          iconSize: 28.sp,
          backgroundColor: Colors.black,
          fixedColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedFontSize: 14.sp,
          unselectedFontSize: 14.sp,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits, color: Colors.white,),label: 'Products'),
            BottomNavigationBarItem(icon: Icon(Icons.category_outlined, color: Colors.white,),label: 'Categories',),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_sharp, color: Colors.white,),label: 'Favourites'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_sharp, color: Colors.white,),label: 'Mitt konto',),
          ],

        ),
      ),
    );
  }
}
