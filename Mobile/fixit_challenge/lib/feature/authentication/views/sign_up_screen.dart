import 'package:fixit/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


import '../../../core/base/base_state.dart';
import '../../../core/base/base_view.dart';
import '../../../utils/colors.dart';
import '../../../utils/screen_size.dart';
import '../../../utils/text_style.dart';
import '../../../widgets/k_button.dart';
import '../../../widgets/k_textfield.dart';
import '../../home/views/home_screen.dart';
import '../controllers/authentication_controller.dart';
import 'login_screen.dart';

class SignupScreen extends BaseView {
  SignupScreen({Key key}) : super(key: key);

  @override
  BaseViewState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends BaseViewState<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void buildMethod() {
    ref.listen(
      authenticationProvider,
      (_, state) {
        if (state is SuccessState) {
          HomeScreen().pushAndRemoveUntil(context);
        } else if (state is ErrorState) {
          snackBar(context,
              title: state.message, backgroundColor: ListifyColors.charcoal);
        }
      },
    );
    super.buildMethod();
  }

  @override
  Widget body() {
    final authState = ref.watch(authenticationProvider);

    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: ListifySize.height(288)),
            Container(
              width: ListifySize.width(439),
              child: Text(
                "Not your everyday Todo app!",
                textAlign: TextAlign.center,
                style: ListifyTextStyle.headLine3,
              ),
            ),
            SizedBox(height: ListifySize.height(44)),
            KTextFormField(
              hintText: 'Email Address',
              controller: emailController,
            ),
            SizedBox(height: ListifySize.height(37)),
            KTextFormField(
              hintText: 'Password',
              controller: passwordController,
              isPasswordField: true,
            ),
            SizedBox(height: ListifySize.height(37)),
            KTextFormField(
              hintText: 'Confirm Password',
              controller: confirmPasswordController,
              isPasswordField: true,
            ),
            SizedBox(height: ListifySize.height(106)),
            KFilledButton(
              buttonText:
                  authState is LoadingState ? 'Please wait' : 'Create Account',
              buttonColor: authState is LoadingState
                  ? ListifyColors.spaceCadet
                  : ListifyColors.primary,
              onPressed: () {
                if (!(authState is LoadingState)) {
                  hideKeyboard(context);
                  if (emailController.text.trim().isNotEmpty) {
                    if (passwordController.text == confirmPasswordController.text) {
                      ref.read(authenticationProvider.notifier).signUp(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                    } else {
                      snackBar(context,
                          title: "Password doesn't match",
                          backgroundColor: ListifyColors.charcoal);
                    }
                  }
                }
              },
            ),
            SizedBox(height: ListifySize.height(110)),
            Text(
              "Already have an account?",
              textAlign: TextAlign.center,
              style: ListifyTextStyle.bodyText3(),
            ),
            SizedBox(height: ListifySize.height(6)),
            KTextButton(
                buttonText: "Login",
                onPressed: () {
                  LoginScreen().pushReplacement(context);
                })
          ],
        ),
        Positioned(child: Image.asset("assets/elements/Asset 2.png") , top: 0,),
      ],
    );
  }
}
