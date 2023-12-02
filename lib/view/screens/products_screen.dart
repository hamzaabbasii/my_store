import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/constants/app_constants.dart';
import 'package:my_store/controller/product_controller.dart';
import 'package:my_store/view/screens/product_detail_screen.dart';
import '../../model/product_model.dart';
import '../../service/api_service.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});
  //final ProductModel productModel;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  // final ProductController productModel = Get.put(ProductController());
  // TextEditingController _searchController = TextEditingController();
  // var searchResult = <Product>[];
  final ApiService apiService = ApiService();
  late List<String> categories;

  String query = '';
  List<Product> filteredProduct = [];
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    apiService.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.sp),
        child: FutureBuilder(
          future: apiService.fetchProducts(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final product = snapshot.data!.products;
                filteredProduct = query.isEmpty ? product : filteredProduct;
                return Column(children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  Center(
                    child: Text(
                      'Products',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Form(
                    key: formKey,
                    child: TextFormField(
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          query = value!.toLowerCase();
                          filteredProduct = product
                              .where((product) =>
                                  product.title.toLowerCase().contains(query) ||
                                  product.brand.toLowerCase().contains(query))
                              .toList();
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a search query';
                        }
                        return null;
                      },
                      cursorColor: AppConstants.kPrimary,
                      decoration: InputDecoration(
                        hintText: 'Iphone',
                        prefixIcon: Icon(
                          Icons.search_sharp,
                          color: AppConstants.kPrimary,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.5.sp,
                            color: AppConstants.kPrimary,
                          ),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.5.sp,
                            color: AppConstants.kPrimary,
                          ),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.5.sp,
                            color: AppConstants.kPrimary,
                          ),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${filteredProduct.length} results found',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 13.sp, color: Colors.grey[500]),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: filteredProduct.length,
                          itemBuilder: (context, index) {
                            Product product = filteredProduct[index];
                            var thumbnailUrl = product.thumbnail;
                            if (!thumbnailUrl.startsWith('http://') &&
                                !thumbnailUrl.startsWith('https://')) {
                              thumbnailUrl = 'https://' + thumbnailUrl;
                            }
                            return Padding(
                              padding: EdgeInsets.only(bottom: 15.h),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailScreen(
                                                  product: product,
                                                )));
                                  },
                                  child: Container(
                                    width: 300.h,
                                    height: 300.h,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            width: 0.5.w,
                                            color: AppConstants.kborder),
                                        right: BorderSide(
                                            width: 0.5.w,
                                            color: AppConstants.kborder),
                                        bottom: BorderSide(
                                            width: 0.5.w,
                                            color: AppConstants.kborder),
                                      ),
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          thumbnailUrl,
                                          width: double.infinity,
                                          height: 170.h,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                product.title,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    right: 15.w),
                                                child: Text(
                                                  '\$${product.price}',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              product.rating.toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 5.w,),
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
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          product.brand,
                                          style: GoogleFonts.poppins(
                                              fontSize: 12.sp,
                                              color: Colors.grey[500]),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          product.category,
                                          style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }))
                ]);
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
