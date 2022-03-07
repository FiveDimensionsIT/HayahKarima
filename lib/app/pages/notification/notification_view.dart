import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/shadow_view.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

import '../../common/themes/app_colors.dart';

class NotificationView extends StatelessWidget {
  NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.current.neutral,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(136),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                AppToolbar(
                  title: AppText.notification,
                  backCallBack: () {},
                ),
                Empty(
                  height: 24,
                ),
                TabBar(
                  indicatorColor: Colors.transparent,
                  padding: const EdgeInsets.only(left: 136),
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  tabs: [
                    _buildContentButton(AppText.all, 48,
                        AppColors.current.neutral, AppColors.current.accent),
                    _buildContentButton(
                        AppText.notRead,
                        96,
                        AppColors.current.accent,
                        AppColors.current.accent.withOpacity(0.2)),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: _contentBody(),
      ),
    );
  }

  Widget _buildContentButton(
      String text, double width, Color fontColor, Color colorContinaer) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: colorContinaer, borderRadius: BorderRadius.circular(12)),
      child: Tab(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: fontColor),
        ),
      ),
    );
  }

  Widget _contentBody() {
    return TabBarView(
        children: [
      Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 1,
            child: _contentNotification(),
          ),
        ],
      ),
      Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 1,
            child: _contentNotification(),
          ),
        ],
      ),
    ]);
  }

  Widget _contentNotification(){
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ShadowView(
            child: Container(
              color: index % 2 == 0
                  ? AppColors.current.neutral
                  : AppColors.current.primary.withOpacity(0.05),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              'assets/images/icon_user.png',
                            ))),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width / 1.65,
                        child: Text(
                          'هناك حقيقة مثبتة منذ زمن طويل وهى ان المحتوى المقروء لصفحة  ',
                          maxLines: 2,
                          softWrap: true,
                          //overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppColors.current.text,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '14 الاثنين.فبراير 2022',
                        style:
                        TextStyle(color: AppColors.current.primary),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: Get.width / 12,
                    child: Text(
                      "...",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.current.dimmed,
                          letterSpacing: 1),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
