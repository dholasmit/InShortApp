import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/ui/base_setting/controller/edit_profile_controller.dart';

import '../../../custem_class/constant/app_colors.dart';
import '../../../custem_class/constant/app_functions.dart';
import '../../../custem_class/constant/app_icons.dart';
import '../../../custem_class/constant/app_images.dart';
import '../../../shared/image_picker_controller.dart';
import '../../../shared/material_button.dart';
import '../../../shared/textfild_common.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = "/EditProfileScreen";

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  EditProfileController editProfileController =
      Get.find<EditProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          disposeKeyboard();
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.bgWithContainerImage),
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
              builder: (EditProfileController editProfileController) {
                return Column(
                  children: [
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
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            ///    appImagePicker.openBottomSheet();
                            // appImagePicker.openDialog();
                          },
                          child: Image.asset(
                            AppIcons.editIcons,
                            width: 27,
                          ),
                        ),
                        const SizedBox(width: 20),
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
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            children: [
                              const SizedBox(height: 30),
                              profileDetails(context),
                              // InkWell(
                              //   onTap: () {
                              //     // profileDetails(context);
                              //   },
                              //   child: Stack(
                              //     alignment: Alignment.bottomRight,
                              //     children: [
                              //       Image.asset(
                              //         AppIcons.editProfileIcons,
                              //         color: AppColors.blueColor,
                              //         height: 120,
                              //       ),
                              //       InkWell(
                              //         onTap: () {},
                              //         child: Image.asset(
                              //           AppIcons.cameraIcons,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              const SizedBox(height: 30),
                              RequestFormTextfield(
                                formFieldType:
                                    RequestFormFieldType.profileUserName,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                controller:
                                    editProfileController.userNameController,
                              ),
                              const SizedBox(height: 15),
                              RequestFormTextfield(
                                formFieldType:
                                    RequestFormFieldType.profileFullName,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                controller:
                                    editProfileController.fullNameController,
                              ),
                              const SizedBox(height: 15),
                              RequestFormTextfield(
                                formFieldType:
                                    RequestFormFieldType.profileEmail,
                                textCapitalization: TextCapitalization.none,
                                textInputAction: TextInputAction.next,
                                controller:
                                    editProfileController.emailController,
                              ),
                              const SizedBox(height: 15),
                              RequestFormTextfield(
                                formFieldType:
                                    RequestFormFieldType.profilePhoneNumber,
                                textCapitalization: TextCapitalization.none,
                                textInputAction: TextInputAction.done,
                                controller:
                                    editProfileController.phoneNumberController,
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
        ),
      ),
    );
  }

  Widget profileDetails(BuildContext context) {
    return GetBuilder(builder: (ImagePickerController imagePickerController) {
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              //appImagePicker.openDialog();

              /// appImagePicker.openBottomSheet();
            },
            child: imagePickerController.image.isEmpty
                ? Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image.asset(
                        AppIcons.editProfileIcons,
                        color: AppColors.blueColor,
                        height: 120,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          AppIcons.cameraIcons,
                        ),
                      ),
                    ],
                  )
                : CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.transparent,
                    backgroundImage: FileImage(
                      File(imagePickerController.image),
                    ),
                  ),
          ),
        ],
      );
    });
  }
}
