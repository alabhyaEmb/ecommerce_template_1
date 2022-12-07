import 'dart:developer';

import '../../../../config.dart';

class LoginBody extends StatelessWidget {
  final GlobalKey<FormState>? formKey;

  const LoginBody({Key? key, this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (loginCtrl) {
      return Column(children: [
        //app bar layout
        AuthenticationAppBar(
            isDone: false, onTap: () => Get.toNamed(routeName.dashboard)),
        const Space(0, 20),

        //text and description layout

        if (loginCtrl.showError)
          Container(
            height: 60,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child: const Center(
                child: Text(
              'Incorrect email or password',
              style: TextStyle(color: Colors.white),
            )),
          ),
        LoginWidget().loginLayout(
            child: AuthenticationTitleText(
                text1: LoginFont().hey,
                text2: LoginFont().loginNow,
                isTextShow: true),
            context: context),
        const Space(0, 35),

        //email text box layout
        const LoginEmailTextForm(),
        const Space(0, 15),

        //password text box layout
        const LoginPasswordTextForm(),
        const Space(0, 10),

        //forgot password text layout
        LoginWidget().forgotPasswordLayout(
            onTap: () => Get.toNamed(routeName.forgotPassword),
            color: loginCtrl.appCtrl.appTheme.primary,
            text: LoginFont().forgotPassword),
        const Space(0, 35),

        //button layout
        SignInButton(
          onTap: () async {
            FocusScopeNode currentFocus = FocusScope.of(Get.context!);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
            if (formKey!.currentState!.validate()) {
              var result = await loginCtrl.apiService.userSignIn(
                  email: loginCtrl.txtEmail.text,
                  password: loginCtrl.txtPassword.text);
              if (result['status'] == 0) {
                loginCtrl.showError = true;
                loginCtrl.update();
              } else if (result['status'] == 1) {
                appCtrl.storage.write(Session.authToken, result['token']);
                appCtrl.storage.write(Session.isLogin, true);
                log('LoggedIn');
                loginCtrl.showError = false;
                Get.toNamed(routeName.dashboard);
              } else {
                log('Not LoggedIn');
              }
            } else {
              log('No Valid');
            }
          },
          title: LoginFont().signInCapital,
        ),
        const Space(0, 20),

        //or sign in with text layout
        const OrSignInWith(),
        const Space(0, 20),

        //social login layout
        SocialLoginLayout(),
        const Space(0, 30),

        //create new account layout
        const SignUpText(),
        const Space(0, 20)
      ]);
    });
  }
}
