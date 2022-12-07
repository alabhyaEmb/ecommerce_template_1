import '../../../../../config.dart';

class HomeCategoryList extends StatelessWidget {
  const HomeCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<HomeController>(builder: (homeCtrl) {
        return homeCtrl.categoryNewModel.isEmpty
            ? Container()
            : SizedBox(
                height: AppScreenUtil().size(100),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    ListView.builder(
                      itemCount: homeCtrl.categoryNewModel.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return HomeCategoryData(
                          data: homeCtrl.categoryNewModel[index],
                          index: index,
                        );
                      },
                    ),
                    InkWell(
                      onTap: () {
                        homeCtrl.appCtrl.selectedIndex = 1;
                        Get.forceAppUpdate();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          SizedBox(),
                          Icon(Icons.more_horiz),
                          Text('More'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              );
      });
    });
  }
}
