import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_colors.dart';

import '../custem_class/constant/app_settings.dart';

materialButton({required void Function() onTap, required String btnText}) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      height: 50,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.signupBTNColor,
        ),
        child: Center(
          child: Text(
            btnText.tr,
            style: const TextStyle(
              fontFamily: kAppFont,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ),
  );
}

materialBorderButton(
  BuildContext context, {
  required void Function() onPressed,
  required String txt,
}) {
  return MaterialButton(
    minWidth: MediaQuery.of(context).size.width,
    height: 45,
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: AppColors.signupBTNColor),
      borderRadius: BorderRadius.circular(8),
    ),
    onPressed: onPressed,
    child: Text(
      txt.tr,
      style: const TextStyle(
        color: AppColors.signupBTNColor,
        fontSize: 18,
        fontFamily: kAppFont,
      ),
    ),
    // color: AppColors.appColor,
  );
}
