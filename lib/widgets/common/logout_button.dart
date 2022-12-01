// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../config.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return InkWell(
          onTap: () {
            appCtrl.selectedIndex = 0;
            // FirebaseAuth.instance.signOut();
            FacebookAuth.instance.logOut();
            appCtrl.storage.erase();
            Get.forceAppUpdate();
            Get.offAllNamed(routeName.login);
          },
          child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  vertical: AppScreenUtil().screenHeight(10)),
              margin: EdgeInsets.symmetric(
                  horizontal: AppScreenUtil().screenWidth(15),
                  vertical: AppScreenUtil().screenHeight(15)),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: appCtrl.appTheme.contentColor, width: 1.5),
                  borderRadius:
                      BorderRadius.circular(AppScreenUtil().borderRadius(5))),
              child: LatoFontStyle(
                  text: CommonTextFont().logOut, fontSize: FontSizes.f16)));
    });
  }
}
