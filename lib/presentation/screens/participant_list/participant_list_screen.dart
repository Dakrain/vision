import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/gen/assets.gen.dart';
import 'package:flutter_base_project/presentation/screens/participant_list/widgets/participant_item.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';

@RoutePage()
class ParticipantListScreen extends StatelessWidget {
  const ParticipantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(const AddMembersRoute());
        },
        shape: const CircleBorder(),
        backgroundColor: kPrimaryColor,
        child: Assets.svg.icons.icUserPlus.svg(),
      ),
      appBar: AppBar(
        title: const Text('Người tham dự'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            color: Colors.white,
            child: const SegmentedControl(labels: [
              'Đang trong phòng (8)',
              'Phòng chờ (3)',
            ]),
          ),
          const Expanded(
              child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                Section(
                  title: 'HOST',
                  children: [ParticipantItem()],
                ),
                Section(
                  title: 'CO-HOST',
                  children: [ParticipantItem()],
                ),
                Section(
                  title: 'ĐÃ THÊM VÀO PHÒNG',
                  children: [ParticipantItem(), ParticipantItem(), ParticipantItem()],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
