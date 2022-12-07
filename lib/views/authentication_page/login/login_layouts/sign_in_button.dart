import '../../../../config.dart';

class SignInButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String title;
  const SignInButton({Key? key, this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: title.toUpperCase(),
      onTap: onTap,
    );
  }
}
