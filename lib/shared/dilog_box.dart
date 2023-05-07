import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showCustomDialog({
  required BuildContext context,
  List<Widget> children = const <Widget>[],
  // double? height,
  // String? title,
  // required String content,
  // required double contentSize,
  // required Function()? onTap,
  // required Color color,
  // required String okText,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ), //this right herea
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
          child: FittedBox(
            child: SizedBox(
                width: Get.width,
                child: Column(
                  children: children,
                )
                // Column(
                //   children: [
                //     const SizedBox(height: 20),
                //     title == null
                //         ? const SizedBox()
                //         : Text(
                //             title,
                //             style: const TextStyle(
                //               fontFamily: kAppFont,
                //               fontWeight: FontWeight.w700,
                //               fontSize: 15,
                //             ),
                //           ),
                //     const SizedBox(height: 16),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 30),
                //       child: Text(
                //         content,
                //         textAlign: TextAlign.center,
                //         style: const TextStyle(
                //           height: 1.4,
                //           fontFamily: kAppFont,
                //           fontSize: 18,
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //     ),
                //     const SizedBox(height: 25),
                //     const Divider(
                //       thickness: 0.5,
                //       color: Colors.black,
                //     ),
                //     SizedBox(
                //       height: 40,
                //       width: double.infinity,
                //       child: MaterialButton(
                //         clipBehavior: Clip.antiAliasWithSaveLayer,
                //         onPressed: onTap,
                //         color: color,
                //         child: Text(
                //           okText,
                //           style: const TextStyle(
                //             color: AppColors.blueColor,
                //             fontFamily: kAppFont,
                //             fontWeight: FontWeight.w500,
                //             fontSize: 16,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                ),
          ),
        ),
      );
    },
  );
}
