import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/widgets/section.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:gap/gap.dart';

@RoutePage()
class AssignCohostScreen extends StatelessWidget {
  const AssignCohostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trao quyền co-host'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
            color: Colors.white,
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(),
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Nhập tên co-host',
                    ),
                  ),
                ),
                const Gap(16),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Hủy',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: kPrimaryColor),
                  ),
                )
              ],
            ),
          ),
          const Gap(24),
          Expanded(
            child: SingleChildScrollView(
              child: Section(
                title: 'NGƯỜI ĐƯỢC TRAO QUYỀN CO-HOST (2)',
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundImage: CachedNetworkImageProvider(
                            'https://ntvb.tmsimg.com/assets/assets/500192_v9_ba.jpg'),
                      ),
                      const Gap(16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nguyen Van A',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'nguyenvana@gmail.com',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: kGreyscale50),
                            )
                          ],
                        ),
                      ),
                      const Gap(16),
                      const Icon(
                        CupertinoIcons.xmark,
                        color: kGreyscale50,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundImage: CachedNetworkImageProvider(
                            'https://upload.wikimedia.org/wikipedia/commons/d/d0/Kagney_Linn_Karter_2010.jpg'),
                      ),
                      const Gap(16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nguyen Van B',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'nguyenvanb@gmail.com',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: kGreyscale50),
                            )
                          ],
                        ),
                      ),
                      const Gap(16),
                      const Icon(
                        CupertinoIcons.xmark,
                        color: kGreyscale50,
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
