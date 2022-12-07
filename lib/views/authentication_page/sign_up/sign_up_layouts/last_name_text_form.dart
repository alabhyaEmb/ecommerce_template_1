import '../../../../config.dart';

class SignupLastNameTextForm extends StatelessWidget {
  const SignupLastNameTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (signUpCtrl) {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: CustomTextFormField(
          radius: 5,
          labelText: SignUpFont().lastName,
          controller: signUpCtrl.txtLastName,
          focusNode: signUpCtrl.lastNameFocus,
          keyboardType: TextInputType.text,
          onFieldSubmitted: (value) {
            SignUpWidget().fieldFocusChange(
                context, signUpCtrl.lastNameFocus, signUpCtrl.emailFocus);
          },
        ),
      );
    });
  }
}
