import 'package:get_storage/get_storage.dart';

import '../../config.dart';

class HomeController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());


  final storage = GetStorage();
  double loginWidth = 40.0;
  double loginHeight = 40.0;
  List<HomeCategoryModel> homeCategoryList = [];
  List<HomeBannerModel> bannerList = [];
  List<HomeDealOfTheDayModel> dealOfTheDayList = [];
  List findStyleCategory = [];
  List biggestDealBrandList = [];
  List offerCornerList = [];
  List<HomeFindStyleCategoryModel> findStyleCategoryList = [];
  List<HomeFindStyleCategoryModel> findStyleCategoryCategoryWiseList = [];
  List<HomeFindStyleCategoryModel> homeKidsCornerList = [];
  int current = 0;
  int selectedStyleCategory = 0;
  final CarouselController controller = CarouselController();
  bool selected = false;

  @override
  void onReady() async {
    getData();
    super.onReady();
  }

//get data list
  getData()async{
    appCtrl.isShimmer = true;
    appCtrl.update();
    homeCategoryList = AppArray().homeCategory;
    bannerList = AppArray().homeBanner;
    dealOfTheDayList = AppArray().homeDealOfTheDayList;
    findStyleCategory = AppArray().homeFindStyleCategory;
    findStyleCategoryList = AppArray().homeFindStyleCategoryList;
    biggestDealBrandList = AppArray().biggestDealBrandList;
    homeKidsCornerList = AppArray().homeKidsCornerList;
      offerCornerList = AppArray().offerCornerList;
    loginWidth = ScreenUtil().screenWidth;
    loginHeight = 500.w;
    update();
    subCategoryList(0, 1);
    update();
    await Future.delayed(Durations.s1);
    appCtrl.isShimmer = false;
    appCtrl.update();
    Get.forceAppUpdate();
  }

  //add to wishlist
  Future<bool?> addToWishList(index, val) async {
    dealOfTheDayList[index].isFav = !val;
    update();
    return dealOfTheDayList[index].isFav;
  }

  //sub category list by category id
  subCategoryList(index, categoryId) async {
    loginWidth = 40.0;
    loginHeight = 40.0;

    update();
    await Future.delayed(Durations.s1);
    selected = !selected;
    findStyleCategoryCategoryWiseList = [];
    selectedStyleCategory = index;

    update();
    for (var i = 0; i < findStyleCategoryList.length; i++) {
      if (categoryId.toString() ==
          findStyleCategoryList[i].categoryId.toString()) {
        findStyleCategoryCategoryWiseList.add(findStyleCategoryList[i]);
      }
    }
    loginWidth = ScreenUtil().screenWidth;
    loginHeight = 500.w;
    update();
  }
}
