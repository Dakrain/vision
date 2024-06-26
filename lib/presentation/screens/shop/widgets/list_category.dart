import 'package:flutter/widgets.dart';
import '../../../../gen/assets.gen.dart';
import 'package:gap/gap.dart';

import '../../home/tabs/dashboard_tab/widgets/quick_asset.dart';

final List<Map<String, dynamic>> categories = [
  {
    'title': 'Tủ sách Khám phá',
    'asset': Assets.svg.icons.icBookmark.path,
    'onTap': () {
      // Handle onTap event for category 1
    },
  },
  {
    'title': 'Vật phẩm Phụng vụ',
    'asset': Assets.svg.icons.icPlus.path,
    'onTap': () {
      // Handle onTap event for category 2
    },
  },
  {
    'title': 'Văn phòng phẩm',
    'asset': Assets.svg.icons.icPen.path,
    'onTap': () {
      // Handle onTap event for category 3
    },
  },
  {
    'title': 'Hàng trang trí',
    'asset': Assets.svg.icons.icGift.path,
    'onTap': () {
      // Handle onTap event for category 4
    },
  },
  {
    'title': 'Mỹ phẩm',
    'asset': Assets.svg.icons.icBookmarkOrange.path,
    'onTap': () {
      // Handle onTap event for category 5
    },
  },
  {
    'title': 'Thời trang',
    'asset': Assets.svg.icons.icBookmarkOrange.path,
    'onTap': () {
      // Handle onTap event for category 6
    },
  },
  {
    'title': 'Văn phòng phẩm',
    'asset': Assets.svg.icons.icBookmarkOrange.path,
    'onTap': () {
      // Handle onTap event for category 7
    },
  },
  {
    'title': 'Hàng trang trí',
    'asset': Assets.svg.icons.icBookmarkOrange.path,
    'onTap': () {
      // Handle onTap event for category 7
    },
  },
];

class ListCategory extends StatelessWidget {
  const ListCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (context, index) => const Gap(8),
              itemBuilder: (context, index) {
                return QuickAsset(
                  title: categories[index]['title'],
                  onTap: categories[index]['onTap'],
                  asset: categories[index]['asset'],
                  itemWidth: ((MediaQuery.sizeOf(context).width - 102) / 4),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
