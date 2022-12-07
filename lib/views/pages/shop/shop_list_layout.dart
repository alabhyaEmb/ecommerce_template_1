import 'package:multikart/views/pages/shop/shop_list_card.dart';

import '../../../config.dart';

class ShopListLayout extends StatelessWidget {
  const ShopListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(builder: (shopCtrl) {
      return shopCtrl.productNewModelList.isEmpty
          ? const Text('No Data')
          : GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: shopCtrl.productNewModelList.length,
              itemBuilder: (context, index) {
                return ShopListCard(data: shopCtrl.productNewModelList[index]);
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 0,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / (1.17)),
              ),
            ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
    });
  }
}
