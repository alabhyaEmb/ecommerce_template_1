import 'package:multikart/models/category_new_model.dart';

import '../../../../../config.dart';

class HomeCategoryData extends StatelessWidget {
  final CategoryNewModel? data;
  final int? index;

  const HomeCategoryData({Key? key, this.data, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return InkWell(
        onTap: () {
          // homeCtrl.appCtrl.isHeart = true;
          // homeCtrl.appCtrl.isCart = true;
          // homeCtrl.appCtrl.isShare = false;
          // homeCtrl.appCtrl.isSearch = false;
          // homeCtrl.appCtrl.isNotification = false;
          // homeCtrl.appCtrl.selectedIndex = 1;
          // homeCtrl.appCtrl.update();
          // homeCtrl.appCtrl.isShimmer = true;
          // homeCtrl.update();
          // await Future.delayed(Durations.s1);
          // homeCtrl.appCtrl.isShimmer = false;
          // homeCtrl.appCtrl.update();
          // Get.forceAppUpdate();
          Get.toNamed(routeName.shopPage,
              arguments: {'name': data!.name, 'id': data!.id});
        },
        child: Padding(
          padding: EdgeInsets.only(
              right: AppScreenUtil().screenWidth(12),
              left: AppScreenUtil().screenWidth(index == 0 ? 10 : 0)),
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                width: AppScreenUtil().screenWidth(60),
                height: AppScreenUtil().screenHeight(60),
                decoration: BoxDecoration(
                  color: homeCtrl.appCtrl.appTheme.homeCategoryColor,
                  shape: BoxShape.circle,
                ),
                child: data!.image!.src == null
                    ? const Center(child: Text('No Image'))
                    : Image.network(data!.image!.src.toString(),
                        fit: BoxFit.cover),
              ),
              LatoFontStyle(
                text: data!.name,
                fontWeight: FontWeight.w600,
                fontSize: FontSizes.f12,
              )
            ],
          ),
        ),
      );
    });
  }
}
