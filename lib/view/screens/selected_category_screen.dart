import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/service/api_service.dart';

import '../../model/product_model.dart';

class SelectedCategoryScreen extends StatefulWidget {
  const SelectedCategoryScreen({super.key, required this.category, required this.products});
  final String category;
  final Future<ProductModel> products;

  @override
  State<SelectedCategoryScreen> createState() => _SelectedCategoryScreenState();
}

class _SelectedCategoryScreenState extends State<SelectedCategoryScreen> {
  TextEditingController _searchController = TextEditingController();
  var searchResult = <Product>[];
  final ApiService apiService = ApiService();
  late List<String> categories = [];


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
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios),
                  SizedBox(
                    width: 50.w,
                  ),
                  Center(
                    child: Text(
                      'Smartphones',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
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
                  prefixIcon: GestureDetector(
                    onTap: ()
                    {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.search_sharp,
                      color: Colors.black,
                    ),
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
            FutureBuilder(future: widget.products, builder: (context,snapshot )
            {
              if(snapshot.hasData)
                {
                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.products.length,
                          itemBuilder: (context, index) {
                            Product product = snapshot.data!.products[index];

                            // Product product = searchResult[index];
                            // var thumbnailUrl = product.thumbnail;
                            // if (!thumbnailUrl.startsWith('http://') &&
                            //     !thumbnailUrl.startsWith('https://')) {
                            //   thumbnailUrl = 'https://' + thumbnailUrl;
                            // }
                            if(product.category == widget.category)
                              {
                                return Padding(
                                  padding:EdgeInsets.only(),
                                  child: Container(
                                    width: 300.h,
                                    height: 300.h,
                                    decoration: BoxDecoration(
                                      //  color: Colors.red,
                                      border: Border(
                                        left: BorderSide(
                                            width: 0.5.w, color: Colors.grey),
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          product.thumbnail,
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
                                            Text(
                                              product.title,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Padding(
                                                padding:
                                                EdgeInsets.only(right: 15.w),
                                                child: Text(
                                                  '\$${product.price}',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.w600),
                                                )),
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
                                );
                              }
                          }));
                }
              else if(snapshot.hasError)
                {
                  return Center(child: Text('Error: ${snapshot.error}'),);
                }
              return Center(child: CircularProgressIndicator(),);
            })
          ],
        ),
      ),
    );
  }
}
