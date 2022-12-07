import 'package:get/get_connect/connect.dart';
import 'package:multikart/common/config/api_constants.dart';
import 'package:multikart/config.dart';
import 'package:multikart/models/category_new_model.dart';
import 'package:multikart/models/product_new_model.dart';

class ApiService extends GetConnect {
  Future<List<CategoryNewModel>> getCategories(
      {int pageNumber = 1, int pageItems = 10, int parentId = 0}) async {
    Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var res = await get(
        "${ApiConstant.baseUrl}products/categories?per_page=$pageItems&page=$pageNumber&parent=$parentId",
        headers: headers);
    if (res.statusCode == 200) {
      List data = res.body;
      List<CategoryNewModel> categoryNewModel =
          data.map((e) => CategoryNewModel.fromJson(e)).toList();

      return categoryNewModel;
    } else {
      throw Exception('Failed to load Category List');
    }
  }

  Future getCategoryProducts({required int categoryId}) async {
    var res = await get(
        "${ApiConstant.baseUrl}products?category=$categoryId&type=simple");

    if (res.statusCode == 200) {
      List data = res.body as List;
      List<ProductNewModel> productNewModel =
          data.map((e) => ProductNewModel.fromJson(e)).toList();
      return productNewModel;
    } else {
      throw Exception('Failed to load Category List');
    }
  }
}
