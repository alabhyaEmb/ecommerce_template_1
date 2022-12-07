import 'package:multikart/models/category_new_model.dart';
import 'package:multikart/utilities/commom_utils.dart';

import '../../../../../config.dart';

class ShopCategoryData extends StatelessWidget {
  final CategoryNewModel? data;
  final int? index;

  const ShopCategoryData({Key? key, this.data, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(builder: (shopCtrl) {
      return InkWell(
        onTap: () async {
          // shopCtrl.appCtrl.isHeart = true;
          // shopCtrl.appCtrl.isCart = true;
          // shopCtrl.appCtrl.isShare = false;
          // shopCtrl.appCtrl.isSearch = false;
          // shopCtrl.appCtrl.isNotification = false;
          // shopCtrl.appCtrl.selectedIndex = 1;
          // shopCtrl.appCtrl.update();
          // shopCtrl.appCtrl.isShimmer = true;
          // shopCtrl.update();
          // await Future.delayed(Durations.s1);
          // shopCtrl.appCtrl.isShimmer = false;
          // shopCtrl.appCtrl.update();
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
                  color: shopCtrl.appCtrl.appTheme.homeCategoryColor,
                  shape: BoxShape.circle,
                ),
                child: data!.image!.src == null
                    ? Center(
                        child: Text(
                          CommonUtils.getInitials(data!.name!),
                        ),
                      )
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
