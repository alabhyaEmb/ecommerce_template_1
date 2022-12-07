import '../../../../config.dart';

class SignupFirstNameTextForm extends StatelessWidget {
  const SignupFirstNameTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (signUpCtrl) {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: CustomTextFormField(
          radius: 5,
          labelText: SignUpFont().firstName,
          controller: signUpCtrl.txtFirstName,
          focusNode: signUpCtrl.firstNameFocus,
          keyboardType: TextInputType.text,
          onFieldSubmitted: (value) {
            SignUpWidget().fieldFocusChange(
                context, signUpCtrl.firstNameFocus, signUpCtrl.lastNameFocus);
          },
        ),
      );
    });
  }
}
