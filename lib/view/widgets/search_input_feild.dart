import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/constants/app_constants.dart';
class SearchInputField extends StatelessWidget {
  const SearchInputField({super.key, this.controller, this.hint, this.onChange});
  final TextEditingController? controller;
  final VoidCallback? onChange;
  final String? hint;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.sp,
      child: TextFormField(
        cursorColor: AppConstants.kPrimary,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(Icons.search_sharp, color: AppConstants.kPrimary,),
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
    );
  }
}