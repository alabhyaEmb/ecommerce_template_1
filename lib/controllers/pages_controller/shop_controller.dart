import 'package:get_storage/get_storage.dart';
import 'package:multikart/models/category_new_model.dart';
import 'package:multikart/services/api_service.dart';

import '../../config.dart';
import '../../models/product_new_model.dart';
import '../../views/pages/filter/filter.dart';

class ShopController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  List<CategoryNewModel> categoryNewModelList = [];
  List<ProductNewModel> productNewModelList = [];
  TextEditingController controller = TextEditingController();
  List<HomeFindStyleCategoryModel> homeShopPageList = [];
  List<HomeCategoryModel> homeCategoryList = [];
  List<CategoryModel> categoryList = [];
  CategoryModel? categoryModel;
  final dashboardCtrl = Get.isRegistered<DashboardController>()
      ? Get.find<DashboardController>()
      : Get.put(DashboardController());
  String name = "";
  final storage = GetStorage();
  final int productId;
  ApiService apiService = ApiService();
  bool isLoading = false;

  ShopController(this.productId);

  @override
  void onReady() async {
    // TODO: implement onReady
    isLoading = true;
    update();
    categoryNewModelList = await apiService.getCategories(parentId: productId);
    productNewModelList =
        await apiService.getCategoryProducts(categoryId: productId);

    name = Get.arguments['name'] ?? "All".tr;
    homeCategoryList = AppArray().homeCategory;
    categoryList = AppArray().categoryList;
    homeShopPageList = AppArray().homeShopPageList;

    appCtrl.isNotification = true;
    appCtrl.update();
    isLoading = false;
    update();
    super.onReady();
  }

  //filter page route
  Route createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Filter(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  //bottom change
  bottomNavigationChange(val, context) async {
    Get.back();
    Get.back();
    dashboardCtrl.bottomNavigationChange(val, context);
  }

  //go back to home page
  goToHomePage() async {
    if (name == "All".tr) {
      appCtrl.goToHome();

      await storage.write(Session.selectedIndex, 0);
      appCtrl.selectedIndex = 0;
    } else {
      appCtrl.isNotification = false;
      await storage.write(Session.selectedIndex, 1);
      appCtrl.selectedIndex = 1;
    }
    update();
    appCtrl.update();
    Get.back();
  }
}
