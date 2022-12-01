import '../../config.dart';

class SocialLoginLayout extends StatelessWidget {
  final loginCtrl = Get.isRegistered<SocialLoginController>()
      ? Get.find<SocialLoginController>()
      : Get.put(SocialLoginController());

  SocialLoginLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialLoginController>(builder: (_) {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialButtonLayout(
              image: iconAssets.google,
            ).gestures(onTap: () => null
                // loginCtrl.googleLogin()
                ),
            const Space(15, 0),
            SocialButtonLayout(
              image: iconAssets.fb,
            ).gestures(
                onTap: () =>
                    // loginCtrl.facebookLogin()
                    null),
            const Space(15, 0),
            SocialButtonLayout(
              image: iconAssets.apple,
            ).gestures(onTap: () {}),
          ],
        ),
      );
    });
  }
}
