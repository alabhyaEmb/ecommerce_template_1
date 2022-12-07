import 'package:multikart/widgets/common_product_card/common_product_card1.dart';

import '../../../../../config.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //product information
            const ProductInformation(),
            //review layout
            const ProductReviewLayout(),
            const BorderLineLayout(),

            //delivery offer layout
            if (productCtrl.product.deliverOfferModel != null)
              DeliveryOfferLayout(
                  deliverOfferModel: productCtrl.product.deliverOfferModel),
            const BorderLineLayout(),

            //similar product text layout
            ProductDetailWidget().commonText(
                text: ProductDetailFont().similarProducts,
                fontSize: FontSizes.f14),

            //similar product layout

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  productCtrl.similarProductList!.length,
                  (index) => CommonProductCard1(
                          data: productCtrl.similarProductList![index])
                      .paddingOnly(
                    right: AppScreenUtil().screenWidth(10),
                  ),
                ),
              ).marginOnly(
                left: AppScreenUtil().screenWidth(15),
                top: AppScreenUtil().screenHeight(10),
                bottom: AppScreenUtil().screenHeight(60),
              ),
            )
            // SimilarProductLayout(data: productCtrl.similarList),
          ],
        ),
      );
    });
  }
}
