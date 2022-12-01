import 'package:flutter/cupertino.dart';
import '../../../config.dart';

class ProductDetail extends StatelessWidget {
  final productCtrl = Get.put(ProductDetailController());

  ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (_) {
      return Directionality(
        textDirection:
            productCtrl.appCtrl.isRTL || productCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: WillPopScope(
          onWillPop: () async {
            productCtrl.appCtrl.goToHome();
            Get.back();
            return true;
          },
          child: Scaffold(
            backgroundColor: productCtrl.appCtrl.appTheme.whiteColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: productCtrl.appCtrl.appTheme.whiteColor,
              automaticallyImplyLeading: false,
              leading: Icon(
                CupertinoIcons.arrow_left,
                size: AppScreenUtil().size(25),
                color: productCtrl.appCtrl.appTheme.blackColor,
              ).gestures(onTap: () {
                productCtrl.appCtrl.goToHome();
                Get.back();
              }),
              title: LatoFontStyle(
                  text: productCtrl.product.title != null? productCtrl.product.title.toString().tr :"",
                  fontSize: FontSizes.f16,
                  fontWeight: FontWeight.w700),
              actions: const[
                AppBarActionLayout(

                )
              ],
            ),
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: const [ProductBody(), ProductBottom()],
            ),
          ),
        ),
      );
    });
  }
}
