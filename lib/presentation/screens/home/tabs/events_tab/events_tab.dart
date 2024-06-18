import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/utilities/extensions.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:gap/gap.dart';

import 'widgets/event_item.dart';

class EventsTab extends StatelessWidget {
  const EventsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          title: const Text('Sự kiện'),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              color: Colors.white,
              child: const SegmentedControl(
                labels: ['Đang diễn ra', 'Sắp diễn ra', 'Đã kết thúc'],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                children: [
                  const EventItem(),
                  const EventItem(),
                ].separated(const Gap(16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
