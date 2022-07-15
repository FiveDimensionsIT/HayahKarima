import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/timeline_post_model.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/3dots_view.dart';
import 'package:hayah_karema/app/common/widgets/profile_image.dart';
import 'package:hayah_karema/app/common/widgets/video_player.dart';
import 'package:hayah_karema/app/common/widgets/youtube_player.dart';
import 'package:hayah_karema/app/pages/home/home_controller.dart';
import 'package:hayah_karema/utils/DateHelper.dart';
import 'package:hayah_karema/utils/ui/empty.dart';
import 'package:readmore/readmore.dart';

class TimelineItemView extends GetView<HomeController> {
  final TimelinePostModel item;
  const TimelineItemView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildHomeData();
  }

  Widget _buildHomeData() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.current.accent, width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPersonInfo(),
          _buildPost(),
          _buildTypePost(),
          _buildImagePost(),
          _buildAllStatistic(),
          _buildBtPost(),
        ],
      ),
    );
  }

  Widget _buildPersonInfo() {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              item.userAvatar ?? '',
              width: 55,
              height: 55,
              errorBuilder: (_, __, ___) => SizedBox(width: 55, height: 55, child: Image.asset(AppAssets.userIcon),),
            )),
        Empty(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.userName ?? '',
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: Get.textTheme.headline3?.fontSize, fontWeight: FontWeight.bold),
              ),
              Text(
                getUserRewardDate(item.approveDate ?? ''),
                style: TextStyle(
                  color: AppColors.current.primary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Empty(
          width: 8,
        ),
        DotsView(onClick: () {})
      ],
    );
  }

  Widget _buildPost() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ReadMoreText(
        item.post ?? '',
        trimLines: 3,
        colorClickableText: AppColors.current.dimmed,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Show more',
        trimExpandedText: 'Show less',
        moreStyle: TextStyle(
          color: AppColors.current.dimmed,
          fontSize: Get.textTheme.bodySmall?.fontSize,
        ),
        lessStyle: TextStyle(
          color: AppColors.current.dimmed,
          fontSize: Get.textTheme.bodySmall?.fontSize,
        ),
        style: TextStyle(
          fontSize: Get.textTheme.bodyLarge?.fontSize,
        ),
      ),
    );
  }

  Widget _buildTypePost() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      decoration:
          BoxDecoration(color: AppColors.current.accent.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
      child: Text(
        item.postType ?? '',
        style: TextStyle(fontSize: 14, color: AppColors.current.accent, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildImagePost() {
    if (item.attachments == null || item.attachments!.isEmpty) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CarouselSlider(
        items: item.attachments
            ?.map((e) => ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: e.mediaType == MediaType.IMAGE
                      ? _buildPostImage(e)
                      : e.fileName!.startsWith("https://www.youtube.com/")
                          ? _buildYouTubeVideo(e)
                          : _buildVideo(e),
                ))
            .toList(),
        options:
            CarouselOptions(autoPlay: false, enlargeCenterPage: true, aspectRatio: 2.0, enableInfiniteScroll: false),
      ),
    );
  }

  Widget _buildPostImage(AttachmentModel e) {
    return Image.network(
      e.fileName ?? '',
      fit: BoxFit.cover,
      width: Get.width,
      height: Get.height / 5,
      errorBuilder: (_, __, ___) {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.current.dimmedLight,
              border: Border.all(color: AppColors.current.dimmed.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(16)),
          child: Image.asset(
            AppAssets.empty,
            color: AppColors.current.dimmed.withOpacity(0.5),
            width: Get.width,
            height: Get.height / 5,
          ),
        );
      },
    );
  }

  Widget _buildVideo(AttachmentModel e) {
    return Container(
        width: Get.width,
        height: Get.height / 5,
        decoration: BoxDecoration(
          color: AppColors.current.dimmedLight,
          border: Border.all(color: AppColors.current.dimmed.withOpacity(0.5)),
        ),
        child: VideoPlayerView(videoUrl: e.fileName ?? ''));
  }

  Widget _buildYouTubeVideo(AttachmentModel e) {
    return Container(
        width: Get.width,
        height: Get.height / 5,
        decoration: BoxDecoration(
          color: AppColors.current.dimmedLight,
          border: Border.all(color: AppColors.current.dimmed.withOpacity(0.5)),
        ),
        child: YoutubePlayerView(videoUrl: e.fileName ?? ''));
  }

  Widget _buildAllStatistic() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          _buildStatistic('1205', 'assets/icons/views_green.svg'),
          _buildStatistic('126', 'assets/icons/comments_green.svg'),
          _buildStatistic('3540', 'assets/icons/stars_green.svg'),
          _buildStatistic('854', 'assets/icons/shares_green.svg'),
        ],
      ),
    );
  }

  Widget _buildStatistic(title, icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.current.neutral,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.current.primary,
              fontSize: Get.textTheme.bodySmall?.fontSize,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          SvgPicture.asset(
            icon,
            width: 17,
            height: 17,
          )
        ],
      ),
    );
  }

  Widget _buildBtPost() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildBtCommentShare(
              icon: 'assets/icons/like_orange.svg',
              title: AppText.like,
              onPress: () {
                controller.changeColorBtLike();
              }),
          _buildBtCommentShare(
              icon: 'assets/icons/comments_orange.svg',
              title: AppText.comment,
              onPress: () {
                controller.goToCommentView();
              }),
          _buildBtCommentShare(icon: 'assets/icons/share_oranges.svg', title: AppText.sharing, onPress: () {
            controller.sharePost(post: item);
          }),
        ],
      ),
    );
  }

  Widget _buildBtCommentShare({required icon, required title, required onPress}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.current.neutral,
          border: Border.all(width: 1.2, color: AppColors.current.accent)),
      child: InkWell(
        onTap: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              icon,
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: TextStyle(
                  color: AppColors.current.accent,
                  fontSize: Get.textTheme.bodySmall?.fontSize,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
