import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/controller/fav_controller.dart';
import 'package:my_store/controller/product_controller.dart';
import 'package:my_store/model/product_model.dart';
import 'package:my_store/service/api_service.dart';

import '../../constants/app_constants.dart';

class MyFavouriteScreen extends StatelessWidget {
  MyFavouriteScreen({
    super.key,
  });

  final apiService = ApiService();
  String truncateAfterCharacters(String text, int maxCharacters) {
    if (text.length <= maxCharacters) {
      return text;
    }

    String truncatedText = text.substring(0, maxCharacters);

    return '$truncatedText...';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<FavoriteController>(
        builder: (controller) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Center(
                  child: Text(
                    'Favourites',
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
                  ' results found',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 13.sp, color: Colors.grey[500]),
                ),
                SizedBox(
                  height: 10.h,
                ),
                FutureBuilder<ProductModel>(
                    future: apiService.fetchProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final prod = snapshot.data!.products;
                        final fav = prod
                            .where(
                                (product) => controller.isFavorite(product.id))
                            .toList();
                        return Expanded(
                            child: ListView.builder(
                                itemCount: fav.length,
                                itemBuilder: (context, index) {
                                  Product product = fav[index];
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 15.h),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Container(
                                        width: 300.h,
                                        height: 100.h,
                                        decoration: BoxDecoration(
                                          //color: Colors.red,
                                          border: Border(
                                            left: BorderSide(
                                                width: 1.w,
                                                color: Color(0xFF0C0C0C0D)),
                                            bottom: BorderSide(
                                                width: 1.w,
                                                color: Color(0xFF0C0C0C0D)),
                                            right: BorderSide(
                                                width: 1.w,
                                                color: Color(0xFF0C0C0C0D)),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                    //  crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 15.w),
                                                        child: CircleAvatar(
                                                          radius: 45.r,
                                                          backgroundImage:
                                                              NetworkImage(product
                                                                  .thumbnail),
                                                        ),
                                                      ),
                                                    ]),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 25.h,
                                                    ),
                                                    Text(
                                                      truncateAfterCharacters(product.title, 10),
                                                      overflow: TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                    Text(
                                                      '${product.price}',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          product.rating
                                                              .toString(),
                                                          style: AppConstants
                                                              .kPoppins(
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                        ),
                                                        SizedBox(
                                                          width: 10.sp,
                                                        ),
                                                        RatingBar.builder(
                                                          initialRating:
                                                              product.rating,
                                                          minRating: 0,
                                                          itemSize: 12,
                                                          direction:
                                                              Axis.horizontal,
                                                          allowHalfRating: true,
                                                          itemCount: 5,
                                                          itemBuilder:
                                                              (context, _) =>
                                                                  const Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                          ),
                                                          onRatingUpdate:
                                                              (rating) {},
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 30.w,),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        controller
                                                            .toggleFavorite(
                                                                product);
                                                        Get.to(
                                                            MyFavouriteScreen());
                                                      },
                                                      icon: Icon(
                                                          controller.isFavorite(
                                                                  product.id)
                                                              ? Icons.favorite
                                                              : Icons
                                                                  .favorite_border,
                                                          size: 30.sp,
                                                          color: controller
                                                                  .isFavorite(
                                                                      product
                                                                          .id)
                                                              ? Colors.red
                                                              : null),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }));
                      }

                      return Center();
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}

// Padding(
//   child: Obx(
//     () => IconButton(
//       onPressed: () {
//         controller.favClicked(index);
//       },
//       icon: Icon(
//           controller.favorites
//                   .contains(index)
//               ? Icons.favorite
//               : Icons.favorite_border,
//           size: 25.sp,
//           color: controller.favorites
//                   .contains(index)
//               ? Colors.red
//               : null),
//     ),
//   ),
//   padding: EdgeInsets.only(right: 20.w),
// ),
