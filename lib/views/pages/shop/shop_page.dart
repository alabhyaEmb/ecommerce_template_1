import 'package:multikart/config.dart';
import 'package:multikart/shimmer_layouts/category_shimmer/shop_shimmer.dart';
import 'package:multikart/views/pages/shop/shop_category_layouts/shop_category_list.dart';
import 'package:multikart/views/pages/shop/shop_list_layout.dart';

class ShopPage extends StatelessWidget {
  final shopCtrl = Get.put(ShopController(Get.arguments['id']));

  ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    shopCtrl.fetchData();
    return GetBuilder<ShopController>(builder: (_) {
      return Directionality(
        textDirection:
            shopCtrl.appCtrl.isRTL || shopCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: WillPopScope(
          onWillPop: () async {
            Get.offNamed(routeName.dashboard);
            return true;
          },
          child: Scaffold(
            appBar: HomeProductAppBar(
              onTap: () async {
                Get.offNamed(routeName.dashboard);
              },
              titleChild: CommonAppBarTitle(
                title: shopCtrl.name,
                desc:
                    "${shopCtrl.productNewModelList.length} ${ShopFont().products}",
              ),
            ),
            body: shopCtrl.isLoading
                ? const ShopShimmer()
                : SingleChildScrollView(
                    child: Column(children: [
                    const ShopCategoryList(),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          //search text box layout
                          Expanded(
                            child: SearchTextBox(
                              controller: shopCtrl.controller,
                              suffixIcon: SearchWidget().suffixIcon(),
                              prefixIcon: SearchWidget().prefixIcon(),
                            ),
                          ),
                          //filter icon layout
                          const FilterIconLayout().gestures(
                              onTap: () => Navigator.of(context)
                                  .push(shopCtrl.createRoute()))
                        ],
                      ),
                    ),
                    const Space(0, 20),
                    //shop list layout
                    shopCtrl.appCtrl.isShimmer
                        ? const ShopShimmer()
                        : const ShopListLayout()
                  ])),
          ),
        ),
      );
    });
  }
}
