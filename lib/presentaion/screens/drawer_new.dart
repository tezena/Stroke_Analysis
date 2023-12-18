import 'package:flutter/material.dart';
import 'package:final_sprs/presentaion/core/app_export.dart';
import 'package:final_sprs/presentaion/core/app_export.dart';
import 'package:final_sprs/presentaion/widgets/app_bar/appbar_image.dart';
import 'package:final_sprs/presentaion/widgets/app_bar/appbar_subtitle.dart';
import 'package:final_sprs/presentaion/widgets/app_bar/appbar_title.dart';
import 'package:final_sprs/presentaion/widgets/app_bar/custom_app_bar.dart';
import 'package:final_sprs/presentaion/widgets/custom/custom_text_form_field.dart';
import 'package:final_sprs/presentaion/widgets/drawer/profileDisplayer.dart';
import "package:final_sprs/presentaion/widgets/drawer/chatHistory.dart";

class NewDrawer extends StatelessWidget {
  NewDrawer({Key? key})
      : super(
          key: key,
        );

  TextEditingController notificationsvaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
        width: 300.h,
        padding: EdgeInsets.symmetric(vertical: 10.v),
        decoration: BoxDecoration(color: Color.fromRGBO(25, 38, 85, 1)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.v),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5.v),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(children: [
                          Row(
                            children: [
                              Container(
                                height: 40.adaptSize,
                                width: 40.adaptSize,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(
                                    4.h,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 12.h,
                                  top: 3.v,
                                ),
                                child: Column(
                                  children: [
                                    AppbarTitle(
                                      text: "Neurogen AI",
                                    ),
                                    AppbarSubtitle(
                                      text: "Fighting Stroke",
                                      margin: EdgeInsets.only(
                                        top: 4.v,
                                        right: 14.h,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 12.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.h,
                        ),
                        decoration: AppDecoration.fillWhiteA.copyWith(
                          borderRadius: BorderRadiusStyle2.roundedBorder4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgFrame,
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.h),
                              child: Text(
                                "Notifications",
                                style: theme.textTheme.bodyMedium,
                              ),
                            ),
                            Spacer(),
                            Container(
                                height: 50.v,
                                padding: EdgeInsets.symmetric(horizontal: 8.h),
                                decoration: AppDecoration.fillPink.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle2.roundedBorder4,
                                ),
                                child: Center(
                                  child: Text("8",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18)),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.v),
                      Divider(
                        color: Colors.white,
                        thickness: 2,
                        indent: 2,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16.h,
                          top: 15.v,
                          right: 16.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 1.v),
                              child: Text(
                                "Main Boards",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ChatHistory(),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16.h,
                          top: 22.v,
                          right: 16.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 2.v),
                              child: Text(
                                "Settings",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 16.h,
                          top: 7.v,
                          right: 16.h,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.h,
                          vertical: 6.v,
                        ),
                        decoration: AppDecoration.fillWhiteA.copyWith(
                            borderRadius: BorderRadiusStyle2.roundedBorder4,
                            color: theme.colorScheme.primary),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomImageView(
                              color: Colors.white,
                              svgPath: ImageConstant.imgVolume,
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 12.h,
                                top: 2.v,
                              ),
                              child: Text("Report a problem",
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    color: appTheme.whiteA700,
                                    fontSize: 18,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 16.h,
                          top: 4.v,
                          right: 16.h,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.h,
                          vertical: 6.v,
                        ),
                        decoration: AppDecoration.fillWhiteA.copyWith(
                            borderRadius: BorderRadiusStyle2.roundedBorder4,
                            color: theme.colorScheme.primary),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomImageView(
                              color: Colors.white,
                              svgPath: ImageConstant.imgFrameGray600,
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 12.h,
                                top: 2.v,
                              ),
                              child: Text("Help guide",
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    color: appTheme.whiteA700,
                                    fontSize: 18,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .32,
                      ),
                      profileDisplayer()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
