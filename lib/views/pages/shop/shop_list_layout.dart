import 'package:multikart/widgets/common_product_card/common_product_card1.dart';

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
                return CommonProductCard1(
                    data: shopCtrl.productNewModelList[index]);

                // ShopListCard();
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
