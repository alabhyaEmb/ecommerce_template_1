import '../../../config.dart';

class BackgroundTextLayout extends StatelessWidget {
  final CategoryModel? categoryModel;
  final int? index;
  final bool? isEven;
  const BackgroundTextLayout({Key? key, this.index, this.isEven,this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Container(
          margin: EdgeInsets.only(
              top: AppScreenUtil().screenHeight(20),
              bottom: AppScreenUtil().screenHeight(10)),
          height: AppScreenUtil().size(90),
          padding: EdgeInsets.only(
              left: AppScreenUtil().screenWidth(18),
              right: AppScreenUtil().screenWidth(18)),
          alignment: isEven! ? Alignment.centerLeft : Alignment.centerRight,
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(AppScreenUtil().borderRadius(5)),
            color: categoryModel!.bgColor,
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment:
            isEven! ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              index == 0
                  ? Image.asset(
                imageAssets.sales,
                height: AppScreenUtil().screenHeight(50),
              )
                  : LatoFontStyle(
                text: categoryModel!.title.toString().tr.toUpperCase(),
                fontSize: FontSizes.f16,
                color: appCtrl.isTheme ?  appCtrl.appTheme.whiteColor: appCtrl.appTheme.blackColor,
                fontWeight: FontWeight.w700,
              ),
              LatoFontStyle(
                text: categoryModel!.description!.tr,
                fontSize: FontSizes.f12,
                color: appCtrl.appTheme.contentColor,
                fontWeight: FontWeight.normal,
              ),
            ],
          ),
        );
      }
    );
  }
}
