import 'dart:developer';

import 'package:multikart/config.dart';
import 'package:multikart/views/authentication_page/sign_up/sign_up_layouts/last_name_text_form.dart';

class SignUpScreen extends StatelessWidget {
  final signUpCtrl = Get.put(SignUpController());

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (_) {
      return AppComponent(
        child: Scaffold(
          body: Directionality(
            textDirection: signUpCtrl.appCtrl.isRTL ||
                    signUpCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: Form(
                key: signUpCtrl.signupFormKey,
                child: SingleChildScrollView(
                    child: Column(children: [
                  //app bar layout
                  AuthenticationAppBar(
                      isDone: false,
                      onTap: () => Get.toNamed(routeName.dashboard)),
                  const Space(0, 20),

                  //hey and sign up text layout
                  SignUpWidget().layout(
                      child: AuthenticationTitleText(
                          text1: SignUpFont().hey,
                          text2: SignUpFont().signUp,
                          isTextShow: true),
                      context: context),
                  const Space(0, 35),

                  //name text box layout
                  const SignupFirstNameTextForm(),
                  const Space(0, 15),

                  const SignupLastNameTextForm(),
                  const Space(0, 15),

                  //email text box layout
                  const SignUpEmailPhoneTextForm(),
                  const Space(0, 15),

                  //password text box layout
                  const SignUpPasswordTextForm(),
                  const Space(0, 35),

                  //button layout
                  SignInButton(
                    title: SignUpFont().signUp.toUpperCase(),
                    onTap: () async {
                      FocusScopeNode currentFocus = FocusScope.of(Get.context!);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      if (signUpCtrl.signupFormKey.currentState!.validate()) {
                        var result = await signUpCtrl.apiService.userSignUp(
                            email: signUpCtrl.txtEmail.text,
                            password: signUpCtrl.txtPassword.text,
                            firstName: signUpCtrl.txtFirstName.text,
                            lastName: signUpCtrl.txtLastName.text);
                        if (result['status'] == 0) {
                          log(result.toString());
                          signUpCtrl.update();
                        } else {
                          log(result.toString());
                          appCtrl.storage
                              .write(Session.authToken, result['token']);
                          appCtrl.storage.write(Session.isLogin, true);
                          log('SignedIn');
                          Get.toNamed(routeName.dashboard);
                        }
                      } else {
                        log('No Valid');
                      }
                    },
                  ),

                  // CustomButton(
                  //     title: SignUpFont().signUp.toUpperCase(),
                  //     onTap: () => signUpCtrl.signIn()),
                  // const Space(0, 20),

                  //or sign in with text layout
                  const OrSignInWith(),
                  const Space(0, 20),

                  //social login layout
                  SocialLoginLayout(),
                  const Space(0, 30),

                  //already account and sign in layout
                  CommonAccountText(
                      text1: CommonTextFont().alreadyAccount,
                      text2: CommonTextFont().signIn,
                      textColor: signUpCtrl.appCtrl.appTheme.blackColor,
                      fontWeight: FontWeight.normal,
                      onTap: () => Get.back()),
                  const Space(0, 20)
                ]))),
          ),
        ),
      );
    });
  }
}
