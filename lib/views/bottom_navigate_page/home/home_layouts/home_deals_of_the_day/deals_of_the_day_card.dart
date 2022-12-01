import '../../../../../config.dart';

class DealsOfTheDayCard extends StatelessWidget {
  final int? index;
  final HomeDealOfTheDayModel? data;

  const DealsOfTheDayCard({Key? key, this.index, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return HomeWidget()
          .dealsOfTheDayCardLayout(
            context: context,
            index: index,
            greyLight25: homeCtrl.appCtrl.appTheme.greyLight25,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    HomeWidget().imageLayout(data!.image),
                    const Space(10, 0),
                    DealsOfTheDayContent(
                      data: data,
                    ),
                  ],
                ),
                LinkHeartIcon(
                  isLiked: data!.isFav,
                  onTap: (val) => homeCtrl.addToWishList(index, val),
                )
              ],
            ),
          )
          .gestures(onTap: () => homeCtrl.appCtrl.goToProductDetail());
    });
  }
}
