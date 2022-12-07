import 'package:multikart/models/product_new_model.dart';

import '../../../../../config.dart';

class ShopListCard extends StatelessWidget {
  final ProductNewModel? data;
  final bool isDiscountShow, isFit;

  const ShopListCard(
      {Key? key, this.data, this.isDiscountShow = true, this.isFit = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return InkWell(
        onTap: () => Get.toNamed(routeName.productDetail, arguments: data),

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
                        : const Center(child: Text('No Image')),
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
              totalPrice: '${appCtrl.priceSymbol} ${(data!.salePrice!)}',
              mrp: '${appCtrl.priceSymbol} ${(data!.price!)}',
              discount: data!.salePrice,
              fontSize: isDiscountShow
                  ? MediaQuery.of(context).size.width > 400
                      ? FontSizes.f11
                      : FontSizes.f12
                  : FontSizes.f12,
              isDiscountShow: isDiscountShow)
        ]),
      );
    });
  }
}
