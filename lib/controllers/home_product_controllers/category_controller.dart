import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:multikart/models/category_new_model.dart';
import 'package:multikart/services/api_service.dart';

import '../../config.dart';

class CategoryController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  List<CategoryModel> categoryList = [];

  int pageSize = 5;
  PagingController<int, CategoryNewModel> pagingController =
      PagingController(firstPageKey: 1);
  ApiService apiService = ApiService();

  @override
  void onReady() async {
    try {
      pagingController.addPageRequestListener((pageKey) async {
        final newItems = await apiService.getCategories(
            pageNumber: pageKey, pageItems: pageSize);
        final isLastPage = newItems.length < pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = pageKey + 1;

          pagingController.appendPage(newItems, nextPageKey);
        }
        Get.forceAppUpdate();
      });
    } catch (error) {
      pagingController.error = error;
    }

    getData();
    super.onReady();
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  //get data list
  getData() async {
    appCtrl.isShimmer = true;
    appCtrl.update();
    categoryList = AppArray().categoryList;

    update();
    await Future.delayed(Durations.s1);
    appCtrl.isShimmer = false;
    appCtrl.update();
    update();
  }

  // fetchCategories() {

  // }
}
