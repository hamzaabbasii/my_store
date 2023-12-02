import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class ApiService extends GetConnect{
  //fetch product data
  Future<ProductModel> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products?limit=100'));

      if (response.statusCode == 200) {
        var productModel = ProductModel.fromJson(json.decode(response.body));
        return productModel;
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }

  //To fetch category
  Future<List<String>> fetchCategories() async {
    var response = await http.get(Uri.parse('https://dummyjson.com/products/categories'));
    print(response);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return List<String>.from(data);
      print(data);
    } else {
      throw Exception('Failed to fetch categories');
    }
  }
}