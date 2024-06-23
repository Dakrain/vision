import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:gap/gap.dart';

@RoutePage()
class AddMembersScreen extends StatelessWidget {
  const AddMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm người vào phòng'),
      ),
      body: Column(
        children: [
          const SearchTextfield(
            hintText: 'Nhap email',
          ),
          const Gap(24),
          Expanded(
            child: SingleChildScrollView(
              child: Section(
                title: 'KẾT QUẢ TÌM KIẾM',
                children: [
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
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'nguyenvanb@gmail.com',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: kGreyscale50),
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
