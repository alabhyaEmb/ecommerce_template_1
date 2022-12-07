import 'package:multikart/views/pages/shop/shop_category_layouts/shop_category_data.dart';

import '../../../../../config.dart';

class ShopCategoryList extends StatelessWidget {
  const ShopCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<ShopController>(builder: (shopCtrl) {
        return shopCtrl.categoryNewModelList.isEmpty
            ? Container()
            : SizedBox(
                height: AppScreenUtil().size(100),
                child: ListView.builder(
                  itemCount: shopCtrl.categoryNewModelList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ShopCategoryData(
                      data: shopCtrl.categoryNewModelList[index],
                      index: index,
                    );
                  },
                ),
              );
      });
    });
  }
}
