// import 'package:get/get.dart';
// import 'package:my_store/model/product_model.dart';
// import 'package:get/get.dart';
//
// import '../service/api_service.dart';
//
// class ProductController extends GetxController{
//   final apiService = ApiService();
//   var productList = <Product>[].obs;
//   var categoryList = <String>[].obs;
//   var favList = <Product>[].obs;
//   var selectedCategory = 'All'.obs;
//   var searchQuery = ''.obs;
//
//   //function to fetch products
//   void fetchProducts()
//   async{
//     try
//         {
//           ProductModel pM = await apiService.fetchProducts();
//           productList.value = pM.products;
//         }
//         catch(e)
//     {
//       Get.snackbar('Error', 'Failed: $e');
//     }
//   }
//
//   //function to fetch categories
//   void fetchCategories()
//   async{
//     try
//     {
//       List<String> category = await apiService.fetchCategories();
//       category.insert(0, 'All');
//       categoryList.value = category;
//     }
//     catch(e)
//     {
//       Get.snackbar('Error', 'Failed: $e');
//     }
//   }
//
//   //fuction to manage the fav product
//   void favTapped(Product product)
//   {
//     if(favList.contains(product))
//       {
//         favList.remove(product);
//       }
//     else
//       {
//         favList.add(product);
//       }
//   }
//
//   //category filter
//   void categoryFilter(String category)
//   {
//     selectedCategory.value = category;
//   }
//
//   void searchProduct(String query)
//   {
//     searchQuery.value = query;
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchProducts();
//     fetchCategories();
//   }
//
//   ///////////////////
//   var products = <Product>[].obs;
//   var favorites = <int>{}.obs;
//   var searchResult = <Product>[].obs;
//    void favClicked(int index)
//    {
//      if(favorites.contains(index))
//        {
//          favorites.remove(index);
//        }
//      else
//        {
//          favorites.add(index);
//        }
//      update();
//    }
//
//   void search(String query) {
//     if (query.isEmpty) {
//       searchResult.clear();
//     } else {
//       searchResult.value = products.where((product) =>
//           product.title.toLowerCase().contains(query.toLowerCase())).toList();
//     }
//   }
// }
