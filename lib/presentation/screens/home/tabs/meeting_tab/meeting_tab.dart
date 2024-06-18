import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/screens/home/tabs/meeting_tab/tabs/ongoing_meetings/ongoing_meetings_tab.dart';

import '../../../../theme/colors.dart';
import 'tabs/create_or_join_meeting/create_or_join_meeting_tab.dart';

class MeetingTab extends StatelessWidget {
  const MeetingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Cuộc họp'),
            centerTitle: true,
            leading: const SizedBox(),
            titleTextStyle: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w600),
            bottom: const TabBar(
                indicatorWeight: 1,
                labelPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                indicatorColor: kPrimaryColor,
                labelColor: Colors.black,
                indicatorPadding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: kGreyscale50,
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: kPrimaryColor, width: 2)),
                tabs: [
                  Tab(
                    text: 'Cuộc họp',
                  ),
                  Tab(
                    text: 'Sự kiện cuộc họp',
                  ),
                ])),
        body: const TabBarView(
          children: [
            CreateOrJoinMeetingTab(),
            OngoingMeetingsTab(),
          ],
        ),
      ),
    );
  }
}
