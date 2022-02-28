import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/pointer_item.dart';
import 'package:hayah_karema/utils/NumberHelper.dart';

class AdminFiltrationPage extends StatelessWidget {
  final String title;
  final Function backCallBack;
  final Color itemBackGround;
  final List list;

  const AdminFiltrationPage(
      {Key? key, required this.title, required this.itemBackGround, required this.list, required this.backCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppToolbar(title: title, backCallBack: backCallBack),
        _buildListView(),
      ],
    );
  }

  Widget _buildListView() {
    return Expanded(
      child: ListView.separated(
          padding: AppTheme.pagePadding,
          itemCount: list.length,
          separatorBuilder: (_, __) => const SizedBox(
                height: 10,
              ),
          itemBuilder: (cxt, index) {
            final maxIndicator = list[0].indicator;
            return PointerItem(
              title: list[index].name,
              subtitle: formatter.format(list[index].indicator),
              percentage: list[index].percentage(maxIndicator),
              itemBackGround: itemBackGround,
            );
          }),
    );
  }
}
