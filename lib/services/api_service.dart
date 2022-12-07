import 'dart:developer';

import 'package:get/get_connect/connect.dart';
import 'package:multikart/common/config/api_constants.dart';
import 'package:multikart/config.dart';
import 'package:multikart/models/category_new_model.dart';
import 'package:multikart/models/product_new_model.dart';
import 'package:multikart/utilities/commom_utils.dart';

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
    var res = await get("${ApiConstant.baseUrl}products?category=$categoryId");

    if (res.statusCode == 200) {
      List data = res.body as List;
      List<ProductNewModel> productNewModel =
          data.map((e) => ProductNewModel.fromJson(e)).toList();
      return productNewModel;
    } else {
      throw Exception('Failed to load Category List');
    }
  }

  Future getSimilarProducts({required List<int> categoryIds}) async {
    String queryIds = CommonUtils.convertListToString(categoryIds);
    var res = await get("${ApiConstant.baseUrl}products?include=$queryIds");

    if (res.statusCode == 200) {
      List data = res.body as List;
      List<ProductNewModel> productNewModelList =
          data.map((e) => ProductNewModel.fromJson(e)).toList();
      return productNewModelList;
    } else {
      throw Exception('Failed to load Similar Product List');
    }
  }

  Future userSignUp(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    Map body = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password
    };
    try {
      var res = await post("${ApiConstant.baseUrl}auth/signUp", body);
      if (res.statusCode == 200) {
        var data = res.body;

        return data;
      } else {
        throw Exception('Failed to create user');
      }
    } catch (error) {
      log(error.toString());
    }
  }

  Future userSignIn({required String email, required String password}) async {
    Map body = {"email": email, "password": password};
    try {
      var res = await post("${ApiConstant.baseUrl}auth/signIn", body);
      if (res.statusCode == 200) {
        var data = res.body;

        return data;
      } else {
        throw Exception('Failed to signIn User');
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
