import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../custem_class/constant/app_functions.dart';
import '../../custem_class/constant/app_settings.dart';
import '../custem_class/constant/app_colors.dart';
import '../custem_class/constant/app_images.dart';

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

enum RequestFormFieldType {
  email,
  password,
  userName,
  confirmPassword,
}

class RequestFormTextfield extends StatefulWidget {
  final RequestFormFieldType formFieldType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final String password;
  final String suffixText;
  final bool isSuffixIcon;
  final bool isPreffixIcon;
  final bool autoFocus;
  FocusNode? focusNode;
  ValueSetter? onChanged;
  GestureTapCallback? onTap;
  VoidCallback? onClear;
  ValueSetter? onFieldSubmitted;
  TextCapitalization? textCapitalization;

  final String? Function(String?)? validator;

  UnderlineInputBorder? border = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black));
  UnderlineInputBorder? errorBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black));
  UnderlineInputBorder? focusBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black));

  RequestFormTextfield({
    Key? key,
    required this.formFieldType,
    required this.textInputAction,
    this.password = "",
    this.suffixText = "",
    this.isSuffixIcon = false,
    this.isPreffixIcon = false,
    required this.controller,
    this.autoFocus = false,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onTap,
    this.onClear,
    this.onFieldSubmitted,
    this.border,
    this.errorBorder,
    this.focusBorder,
    this.textCapitalization,
  }) : super(key: key);

  @override
  State<RequestFormTextfield> createState() => _RequestFormTextfieldState();
}

class _RequestFormTextfieldState extends State<RequestFormTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        if (widget.onChanged != null) widget.onChanged!(value);
      },
      // validator: (value) {
      //   return getValidation(value!);
      // },
      onTap: () {
        if (widget.onTap != null) {
          disposeKeyboard();
          widget.onTap!();
        }
      },
      onFieldSubmitted: (value) {
        if (value.isNotEmpty && widget.onFieldSubmitted != null) {
          widget.onFieldSubmitted!(value);
        }
      },
      keyboardType: getTextInputType(),
      maxLines: getMaxLines,
      readOnly: false,
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      obscureText: false,
      autofocus: widget.autoFocus,
      validator: widget.validator,
      focusNode: widget.focusNode,
      cursorColor: Colors.black,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontFamily: kAppFont,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        // focusedBorder: const UnderlineInputBorder(
        //     borderSide: BorderSide(color: Colors.grey)),
        // contentPadding: const EdgeInsets.only(
        //   top: 10,
        // ),

        labelText: getLabel(),
        hintText: getHintText(),
        suffixText: widget.suffixText,
        filled: true,
        fillColor: const Color(0xffEDEDED),

        suffixStyle: const TextStyle(fontSize: 14, color: Colors.black),
        hintStyle: const TextStyle(
          fontFamily: kAppFont,
          fontSize: 16,
        ),
        errorStyle: const TextStyle(color: Colors.red),
        errorMaxLines: 2,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          // borderSide: BorderSide(color: AppColors.blueColor),
        ),
        enabledBorder: const OutlineInputBorder(
          //borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.blueColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.blueColor),
        ),
        errorBorder: widget.errorBorder,
        focusedErrorBorder: widget.errorBorder,
        suffixIcon: getSuffixIcon(),
        prefixIcon: getPrefixIcon(),
      ),
      textCapitalization: widget.textCapitalization!,

      //textCapitalization: TextCapitalization.words,
    );
  }

  String? getLabel() {
    return null;
  }

  String getHintText() {
    switch (widget.formFieldType) {
      case RequestFormFieldType.email:
        return "E-mail".tr;
      case RequestFormFieldType.password:
        return "Password".tr;

      default:
        break;
    }
    return "";
  }

  // final countryPicker = const FlCountryCodePicker();
  //
  // CountryCode? countryCode;

  Widget? getPrefixIcon() {
    if (widget.isPreffixIcon == false) {
      switch (widget.formFieldType) {
        case RequestFormFieldType.email:
          return prefixIcon(ic: AppImages.emailIcon);
        case RequestFormFieldType.password:
          return prefixIcon(ic: AppImages.lockIcon);
        case RequestFormFieldType.userName:
          return prefixIcon(ic: AppImages.userIcon);
      }
    }
    return null;
  }

  Widget? getSuffixIcon() {
    if (widget.isSuffixIcon == false) {
      switch (widget.formFieldType) {
        // case RequestFormFieldType.email:
        //   return const Icon(Icons.email);
      }
    }
    return null;
  }

  int get getMaxLines {
    switch (widget.formFieldType) {
      default:
        return 1;
    }
  }

  TextInputType getTextInputType() {
    switch (widget.formFieldType) {
      case RequestFormFieldType.email:
        return TextInputType.emailAddress;

      default:
        break;
    }
    return TextInputType.text;
  }

  String? getValidation(String value) {
    if (value.isEmpty) {
      switch (widget.formFieldType) {
        case RequestFormFieldType.password:
          return "Enter Your password";
      }
    }
  }
}

String? validateEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (value!.isEmpty) {
    return "Please enter email";
  }
  if (!regex.hasMatch(
    value.toString(),
  )) {
    return 'Please enter valid email';
  } else {
    return null;
  }
}

prefixIcon({required String ic}) {
  return SizedBox(
    width: 20,
    child: Row(
      children: [
        const SizedBox(width: 10),
        Image.asset(ic),
        const Spacer(),
        Container(
          height: 30,
          width: 2,
          color: AppColors.blueColor,
        ),
        const SizedBox(width: 5),
      ],
    ),
  );
}
