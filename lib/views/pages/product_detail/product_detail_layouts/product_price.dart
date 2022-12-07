import 'package:multikart/models/product_new_model.dart';
import 'package:multikart/utilities/commom_utils.dart';

import '../../../../../config.dart';

class ProductPrice extends StatelessWidget {
  final ProductNewModel? productNewModel;
  const ProductPrice({Key? key, this.productNewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      double percentageOff = 0;

      if (productNewModel!.onSale!) {
        percentageOff = CommonUtils.findDiscountPercentage(
            smallNumber: productNewModel!.salePrice!,
            greaterNumber: productNewModel!.regularPrice!);
      }
      return productNewModel != null
          ? PriceLayout(
                  totalPrice: productNewModel!.onSale!
                      ? '${appCtrl.priceSymbol} ${(productNewModel!.regularPrice)}'
                      : "",
                  mrp: productNewModel!.onSale!
                      ? '${appCtrl.priceSymbol} ${(productNewModel!.salePrice)}'
                      : '${appCtrl.priceSymbol} ${(productNewModel!.regularPrice)}',
                  discount: percentageOff.toString(),
                  fontSize: FontSizes.f16,
                  isBold: false,
                  isDiscountShow: productNewModel!.onSale!)
              .marginOnly(
                  left: AppScreenUtil().screenWidth(10),
                  right: AppScreenUtil().screenWidth(10))
          : Container();
    });
  }
}
