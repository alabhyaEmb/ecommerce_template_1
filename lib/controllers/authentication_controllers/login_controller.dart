// import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multikart/config.dart';
import 'package:multikart/services/api_service.dart';

class LoginController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final socialLoginCtrl = Get.isRegistered<SocialLoginController>()
      ? Get.find<SocialLoginController>()
      : Get.put(SocialLoginController());

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isBack = false;
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  ApiService apiService = ApiService();
  bool passwordVisible = true;
  bool showError = false;
  // var auth = FirebaseAuth.instance;
  final storage = GetStorage();

  // Toggle Between Password show
  toggle() {
    passwordVisible = !passwordVisible;
    update();
  }

  //firebase login with email and password
  // login() async {
  //   socialLoginCtrl.showLoading();
  //   update();
  //   try {
  //     var user = await auth.signInWithEmailAndPassword(
  //         email: txtEmail.text, password: txtPassword.text);
  //     await user.user!.getIdToken();
  //     final User? currentUser = auth.currentUser;
  //     assert(user.user!.uid == currentUser!.uid);
  //     await storage.write('id', user.user!.uid);

  //     txtEmail.text = "";
  //     txtPassword.text = "";
  //     socialLoginCtrl.saveData(user.user!.uid);
  //     socialLoginCtrl.hideLoading();
  //     update();
  //     Get.toNamed(routeName.dashboard);
  //   } on FirebaseAuthException catch (e) {
  //     socialLoginCtrl.hideLoading();
  //     update();
  //     if (e.code == 'wrong-password') {
  //       socialLoginCtrl.showToast('Incorrect Password');
  //     } else if (e.code == 'user-not-found') {
  //       socialLoginCtrl.showToast('Email is not Found');
  //     }
  //   } catch (e) {
  //     socialLoginCtrl.hideLoading();
  //     update();
  //   } finally {
  //     socialLoginCtrl.hideLoading();
  //     update();
  //   }
  // }

  @override
  void onReady() {
    // TODO: implement onReady
    isBack = Get.arguments ?? false;

    update();
    super.onReady();
  }
}
