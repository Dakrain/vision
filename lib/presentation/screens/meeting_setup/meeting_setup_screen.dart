import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/presentation/widgets/section.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/utilities/extensions.dart';
import 'package:gap/gap.dart';

@RoutePage()
class MeetingSetupScreen extends StatelessWidget {
  const MeetingSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt cuộc họp'),
        actions: [
          MaterialButton(
            onPressed: () {
              context.navigateTo(const MeetingRoute());
            },
            child: Text(
              'Xong',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Section(
              title: 'CHỦ ĐỀ CUỘC HỌP',
              withPadding: false,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'CHỦ ĐỀ CUỘC HỌP',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: kPrimaryColor),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ],
            ),
            Section(
              title: 'THÔNG TIN CUỘC HỌP',
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Thời gian bắt đầu',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            '09:30, T4, 09/9/2021',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: kGreyscale50),
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: kGreyscale50,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Người chủ trì',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'Phan Văn Cao',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ID Cuộc họp',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      '567890',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mật khẩu',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      '12345678',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Link chia sẻ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'com.abc.xyz',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                )
              ],
            ),
            Section(
              title: 'CÀI ĐẶT CHO NGƯỜI THAM DỰ',
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Số lượng người tối đa',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            '6',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: kGreyscale50),
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: kGreyscale50,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Kích hoạt phòng chờ xét duyệt',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Switch(value: true, onChanged: (value) {})
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Được phép mở Micrô',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Switch(value: true, onChanged: (value) {})
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Được phép mở Webcam',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Switch(value: true, onChanged: (value) {})
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Được phép Ghi âm',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Switch(value: true, onChanged: (value) {})
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Được phép Chat',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Switch(value: false, onChanged: (value) {})
                  ],
                )
              ],
            ),
            Section(
              title: 'TRAO QUYỀN CO-HOST',
              subTitle:
                  'Trao quyền co-host để giúp cho bạn dể dàng chuyển host cho cuộc họp',
              children: [
                GestureDetector(
                  onTap: () {
                    context.navigateTo(const AssignCohostRoute());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Người được trao quyền co-host',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Row(
                        children: [
                          Text(
                            '6',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: kGreyscale50),
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: kGreyscale50,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                context.navigateTo(const AddMembersRoute());
              },
              child: Container(
                width: double.maxFinite,
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  'Thêm người vào phòng',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: kPrimaryColor),
                ),
              ),
            ),
            Section(
              title: 'CÀI ĐẶT LƯU TRỮ',
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Lưu trữ file ghi âm',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: kGreyscale50,
                      )
                    ],
                  ),
                )
              ],
            ),
          ].separated(const Gap(24)),
        ),
      ),
    );
  }
}
