import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/constants/app_constants.dart';
import 'package:my_store/model/product_model.dart';
import 'package:my_store/view/screens/products_screen.dart';
import 'package:my_store/view/screens/selected_category_screen.dart';

import '../../service/api_service.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
   final ApiService apiService = ApiService();
  // late List<String> categories = [];
  // late List<ProductModel> products = [];
  // String selectedCategory = '';
  // int ind = 0;

  late Future<List<String>> categories;
  late Future<ProductModel> products;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = apiService.fetchCategories();
    products = apiService.fetchProducts();
  }

  // Future<void> fetchCategories() async {
  //   var service = ApiService();
  //   var result = await service.fetchCategories();
  //   setState(() {
  //     categories = result;
  //   });
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            Center(
              child: Text(
                'Categories',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 50.sp,
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Iphone',
                  prefixIcon: Icon(
                    Icons.search_sharp,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    width: 1.5.sp,
                    color: Colors.black,
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    width: 1.5.sp,
                    color: Colors.black,
                  )),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    width: 1.5.sp,
                    color: Colors.black,
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              '234 results found',
              style:
                  GoogleFonts.aBeeZee(fontSize: 13.sp, color: Colors.grey[500]),
            ),
            SizedBox(
              height: 10.h,
            ),
            FutureBuilder<List<String>>(future: categories, builder: (context, snapshot)
            {
              if(snapshot.hasData)
                {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final product = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectedCategoryScreen(category: snapshot.data![index], products: products,)));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/images/img1.png'),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 10.w, bottom: 25.h),
                                  child: Text(
                                    product,
                                    style: AppConstants.kPoppins(
                                        color: Colors.white, fontSize: 16.sp),
                                  )),
                            ),
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                      ),
                    ),
                  );
                }
              return Center();
            }),
            // Expanded(
            //   child: GridView.builder(
            //     itemCount: categories.length,
            //     itemBuilder: (context, index) {
            //       return GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             selectedCategory = categories[index].toString();
            //           });
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => SelectedCategoryScreen(category: selectedCategory,)));
            //         },
            //         child: Container(
            //           decoration: BoxDecoration(
            //             image: const DecorationImage(
            //               image: AssetImage('assets/images/img1.png'),
            //               fit: BoxFit.fill,
            //             ),
            //             borderRadius: BorderRadius.circular(10.r),
            //           ),
            //           padding: EdgeInsets.symmetric(horizontal: 10.w),
            //           child: Align(
            //             alignment: Alignment.bottomLeft,
            //             child: Padding(
            //                 padding: EdgeInsets.only(left: 10.w, bottom: 25.h),
            //                 child: Text(
            //                   categories[index],
            //                   style: AppConstants.kPoppins(
            //                       color: Colors.white, fontSize: 16.sp),
            //                 )),
            //           ),
            //         ),
            //       );
            //     },
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       crossAxisSpacing: 10.w,
            //       mainAxisSpacing: 10.h,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
