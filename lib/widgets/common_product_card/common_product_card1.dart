import 'package:multikart/models/product_new_model.dart';
import 'package:multikart/utilities/commom_utils.dart';

import '../../../../../config.dart';

class CommonProductCard1 extends StatelessWidget {
  final ProductNewModel? data;
  final bool isDiscountShow, isFit;

  CommonProductCard1(
      {Key? key, this.data, this.isDiscountShow = true, this.isFit = true})
      : super(key: key);

  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    double percentageOff = 0;
    if (data!.onSale!) {
      percentageOff = CommonUtils.findDiscountPercentage(
          smallNumber: data!.salePrice!, greaterNumber: data!.regularPrice!);
    }

    return GetBuilder<AppController>(builder: (appCtrl) {
      return InkWell(
        onTap: () =>
            // appCtrl.goToProductArgDetail(data!),

            Get.toNamed(routeName.productDetail,
                arguments: {'data': data!}, preventDuplicates: false),

        //  appCtrl.goToProductDetail(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(alignment: Alignment.topLeft, children: [
            Stack(alignment: Alignment.topRight, children: [
              // ProductImage(image: data!.image.toString(), isFit: isFit),
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(AppScreenUtil().borderRadius(8)),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(AppScreenUtil().borderRadius(5)),
                  ),
                  shadowColor: Colors.grey.withOpacity(.5),
                  child: Container(
                    width: AppScreenUtil().screenWidth(160),
                    height: AppScreenUtil().screenHeight(160),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          AppScreenUtil().borderRadius(5)),
                    ),
                    child: data!.images != null
                        ? Image.network(
                            data!.images!.first.src!,
                            fit: BoxFit.cover,
                          )
                        : Center(
                            child: Text(CommonUtils.getInitials(data!.name!)),
                          ),
                  ),
                ),
              ),
              const LinkHeartIcon(
                isLiked: false,
              ).paddingOnly(
                  top: AppScreenUtil().screenHeight(10),
                  right: AppScreenUtil().screenWidth(15))
            ]),
            // if (data!.isNew) const NewLayout()
          ]),
          const Space(0, 5),
          Rating(
            val: double.parse(data!.averageRating.toString()),
            onRatingUpdate: (val) {},
          ),
          LatoFontStyle(
            text: data!.name!.tr,
            fontSize: FontSizes.f14,
            fontWeight: FontWeight.normal,
            color: appCtrl.appTheme.blackColor,
          ).paddingOnly(left: AppScreenUtil().screenWidth(5)),
          const Space(0, 5),
          PriceLayout(
              totalPrice: data!.onSale!
                  ? '${appCtrl.priceSymbol} ${(data!.regularPrice!)}'
                  : '',
              mrp: data!.onSale!
                  ? '${appCtrl.priceSymbol} ${(data!.salePrice!)}'
                  : '${appCtrl.priceSymbol} ${(data!.regularPrice!)}',
              discount: percentageOff.toString(),
              fontSize: isDiscountShow
                  ? MediaQuery.of(context).size.width > 400
                      ? FontSizes.f11
                      : FontSizes.f12
                  : FontSizes.f12,
              isDiscountShow: data!.onSale!)
        ]),
      );
    });
  }
}
