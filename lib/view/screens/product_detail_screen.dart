import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/constants/app_constants.dart';
import 'package:my_store/controller/fav_controller.dart';
import 'package:my_store/controller/product_controller.dart';

import '../../model/product_model.dart';
import '../../service/api_service.dart';
import 'my_favourite_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  ProductDetailScreen({required this.product});

  final FavoriteController favController = Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.sp),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 25.sp,
                          )),
                      SizedBox(
                        width: 50.w,
                      ),
                      Center(
                        child: Text(
                          'Product Detail',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 35.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Image.network(
                product.thumbnail,
                width: double.infinity,
                height: 200.h,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Detail:',
                      style: AppConstants.kPoppins(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),

                    GetBuilder<FavoriteController>(
                      init: FavoriteController(),
                        builder: (favController)
                            {
                              return IconButton(
                                onPressed: () {
                                  favController.toggleFavorite(product);
                                  Get.to(MyFavouriteScreen());
                                },
                                icon: Icon(
                                    favController.isFavorite(product.id)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 30.sp,
                                    color: favController.isFavorite(product.id)
                                        ? Colors.red
                                        : null),
                              );
                            }
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                child: Row(
                  children: [
                    Text(
                      'Name:',
                      style: AppConstants.kPoppins(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Text(
                      product.title,
                      style: AppConstants.kPoppins(
                          fontSize: 15.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                child: Row(
                  children: [
                    Text(
                      'Price:',
                      style: AppConstants.kPoppins(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 20.sp,
                    ),
                    Text(
                      '\$${product.price}',
                      style: AppConstants.kPoppins(
                          fontSize: 15.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                child: Row(
                  children: [
                    Text(
                      'Category:',
                      style: AppConstants.kPoppins(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Text(
                      product.category,
                      style: AppConstants.kPoppins(
                          fontSize: 15.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                child: Row(
                  children: [
                    Text(
                      'Brand:',
                      style: AppConstants.kPoppins(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Text(
                      product.brand,
                      style: AppConstants.kPoppins(
                          fontSize: 15.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                child: Row(
                  children: [
                    Text(
                      'Brand:',
                      style: AppConstants.kPoppins(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    RatingBar.builder(
                      initialRating: product.rating,
                      minRating: 0,
                      itemSize: 15,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                child: Row(
                  children: [
                    Text(
                      'Stock:',
                      style: AppConstants.kPoppins(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Text(
                      product.stock.toString(),
                      style: AppConstants.kPoppins(
                          fontSize: 15.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.sp),
                child: Text(
                  'Description:',
                  style: AppConstants.kPoppins(
                      fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                child: Text(
                  product.description,
                  style: AppConstants.kPoppins(
                    fontSize: 15.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.sp),
                child: Text(
                  'Product Gallery:',
                  style: AppConstants.kPoppins(
                      fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: SizedBox(
                  height: 200.h,
                  child: GridView.builder(
                    itemCount: product.images.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.w,

                      ),
                      itemBuilder: (context, index)
                  {
                    return Container(
                      child: Image.network(product.images[index], fit: BoxFit.cover,),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
