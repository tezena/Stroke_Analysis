import 'package:flutter/material.dart';
import 'package:final_sprs/presentaion/core/app_export.dart';
import 'package:final_sprs/presentaion/widgets/custom/custom_search_view.dart';

import 'package:final_sprs/presentaion/widgets/botchat_item_widget.dart';

class ChatHistory extends StatefulWidget {
  const ChatHistory({super.key});

  @override
  State<ChatHistory> createState() => _ChatHistoryState();
}

class _ChatHistoryState extends State<ChatHistory> {
  TextEditingController searchController = TextEditingController();
  bool isChatHistoryExpand = false;
  bool isTabed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 16.h,
        top: 4.v,
        right: 16.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 4.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle2.roundedBorder4,
          color: theme.colorScheme.primary),
      child: Column(
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  isChatHistoryExpand = !isChatHistoryExpand;
                  isTabed = !isTabed;
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomImageView(
                    color: Colors.white,
                    svgPath: ImageConstant.imgComputer,
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                    margin: EdgeInsets.only(bottom: 4.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12.h,
                      top: 3.v,
                      bottom: 3.v,
                    ),
                    child: Text(
                      "Chat History",
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: appTheme.whiteA700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              )),
          AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: isChatHistoryExpand ? 380 : 0,
              child: isChatHistoryExpand
                  ? Column(children: [
                      CustomSearchView(
                        autofocus: false,
                        margin: EdgeInsets.only(
                          left: 7.h,
                          top: 23.v,
                          right: 7.h,
                        ),
                        controller: searchController,
                        hintText: "search here",
                        prefix: Container(
                          margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgSearch,
                          ),
                        ),
                        prefixConstraints: BoxConstraints(maxHeight: 48.v),
                        suffix: Padding(
                          padding: EdgeInsets.only(right: 15.h),
                          child: IconButton(
                            onPressed: () {
                              searchController.clear();
                            },
                            icon: Icon(
                              MdiIcons.close,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.v),
                      AnimatedOpacity(
                          duration: const Duration(milliseconds: 100),
                          opacity: isChatHistoryExpand ? 1.0 : 0.0,
                          child: Container(
                              height: 300,
                              margin: EdgeInsets.only(
                                left: 7.h,
                                right: 7.h,
                              ),
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 7.v);
                                },
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return BotchatItemWidget(
                                    onTapBotchat: () {
                                      // onTapBotchat(context);
                                    },
                                  );
                                },
                              ))),
                    ])
                  : const SizedBox.shrink()),
        ],
      ),
    );
  }
}
