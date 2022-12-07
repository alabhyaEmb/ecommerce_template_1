import 'package:multikart/models/product_new_model.dart';

import '../../../../../config.dart';

class ProductPrice extends StatelessWidget {
  final ProductNewModel? productNewModel;
  const ProductPrice({Key? key, this.productNewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return productNewModel != null
          ? PriceLayout(
                  totalPrice:
                      '${appCtrl.priceSymbol} ${(productNewModel!.salePrice)}',
                  mrp: '${appCtrl.priceSymbol} ${(productNewModel!.price)}',
                  discount: productNewModel!.salePrice,
                  fontSize: FontSizes.f16,
                  isBold: false,
                  isDiscountShow: true)
              .marginOnly(
                  left: AppScreenUtil().screenWidth(10),
                  right: AppScreenUtil().screenWidth(10))
          : Container();
    });
  }
}
