import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_functions.dart';
import 'package:inshorts_newj/shared/material_button.dart';

import '../../../custem_class/constant/app_colors.dart';
import '../../../custem_class/constant/app_icons.dart';
import '../../../custem_class/constant/app_images.dart';
import '../../../shared/dilog_box.dart';
import '../../../shared/image_picker_controller.dart';
import '../../../shared/textfild_common.dart';
import '../../base_screen/controller/base_screen_controller.dart';
import '../controller/profile _controller.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = "/ProfileScreen";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ImagePickerController imagePickerController =
      Get.find<ImagePickerController>();
  ProfileScreenController profileScreenController =
      Get.find<ProfileScreenController>();
  BaseScreenController baseScreenController = Get.find<BaseScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          disposeKeyboard();
        },
        child: GetBuilder<BaseScreenController>(
          id: "DarkLightMode",
          builder: (baseScreenController) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    baseSettingController.isNightMode
                        ? AppNightModeImage.bgWithContainerImageNightMode
                        : AppImages.bgWithContainerImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  // left: 15,
                  // right: 15,
                  bottom: 10,
                ),
                child: GetBuilder(
                  builder: (ProfileScreenController profileScreenController) {
                    return Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: AppColors.blueColor,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              "Profile",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 21,
                                color: AppColors.blueColor,
                              ),
                            ),
                            const SizedBox(width: 30),
                            const Spacer(),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            thickness: 2,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                children: [
                                  const SizedBox(height: 30),
                                  Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Image.asset(
                                        AppIcons.editProfileIcons,
                                        color: AppColors.blueColor,
                                        height: 120,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(
                                              EditProfileScreen.routeName);
                                        },
                                        child: Image.asset(
                                          AppIcons.cameraIcons,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  RequestFormTextfield(
                                    formFieldType:
                                        RequestFormFieldType.profileUserName,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    textInputAction: TextInputAction.next,
                                    controller: profileScreenController
                                        .userNameController,
                                  ),
                                  const SizedBox(height: 15),
                                  RequestFormTextfield(
                                    formFieldType:
                                        RequestFormFieldType.profileFullName,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    textInputAction: TextInputAction.next,
                                    controller: profileScreenController
                                        .fullNameController,
                                  ),
                                  const SizedBox(height: 15),
                                  RequestFormTextfield(
                                    formFieldType:
                                        RequestFormFieldType.profileEmail,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.next,
                                    controller:
                                        profileScreenController.emailController,
                                  ),
                                  const SizedBox(height: 15),
                                  RequestFormTextfield(
                                    formFieldType:
                                        RequestFormFieldType.profilePhoneNumber,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.done,
                                    controller: profileScreenController
                                        .phoneNumberController,
                                  ),
                                  const SizedBox(height: 70),
                                  materialButton(
                                    onTap: () {},
                                    btnText: "Submit",
                                    color: AppColors.blueColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
