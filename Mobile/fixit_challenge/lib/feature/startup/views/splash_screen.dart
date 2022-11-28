import 'dart:async';

import 'package:fixit/utils/navigation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/shared_preference_key.dart';
import '../../../core/base/base_view.dart';
import '../../../utils/assets.dart';
import '../../../utils/screen_size.dart';
import '../../../utils/text_style.dart';
import '../../authentication/controllers/authentication_controller.dart';
import '../../authentication/helpers/auth_wrapper.dart';

class SplashScreen extends BaseView {
  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseViewState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initialize();
  }

  initialize() async {
    Timer(Duration(milliseconds: 1000), () {
      /// Checking if app is Newly Installed / User is logged in / User is not
      /// logged in
      if (getBoolAsync(NEW_INSTALL, defaultValue: true)) {
        setValue(NEW_INSTALL, false);
        ref.read(authenticationProvider.notifier).signOut();
      }
      AuthenticationWrapper().pushAndRemoveUntil(context);
    });
  }

  @override
  bool scrollable() => false;

  @override
  Widget body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Listify",
            style: ListifyTextStyle.headLine3,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: ListifySize.height(20),
          ),
          Text(
            "Not your every day todo app",
            style: ListifyTextStyle.subtitle1,
          ),
          Image.asset(
            ListifyAssets.appLogo,
            width: MediaQuery.of(context).size.width * .30,
          ),
        ],
      ),
    );
  }
}
