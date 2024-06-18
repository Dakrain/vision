import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/gen/assets.gen.dart';
import 'package:flutter_base_project/presentation/screens/home/tabs/chat_tab/chat_tab.dart';
import 'package:flutter_base_project/presentation/screens/home/tabs/events_tab/events_tab.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';

import 'tabs/account_tab/account_tab.dart';
import 'tabs/meeting_tab/meeting_tab.dart';
import 'tabs/dashboard_tab/dashboard_tab.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    const DashboardTab(),
    const MeetingTab(),
    const EventsTab(),
    const ChatTab(),
    const AccountTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kGreyscale20,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 24,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            icon: Assets.svg.icons.icHomeDashboard.svg(),
            activeIcon: Assets.svg.icons.icHomeDashboardSelected.svg(),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Assets.svg.icons.icHomeLive.svg(),
            activeIcon: Assets.svg.icons.icHomeLiveSelected.svg(),
            label: 'Cuộc họp',
          ),
          BottomNavigationBarItem(
            icon: Assets.svg.icons.icHomeEvent.svg(),
            activeIcon: Assets.svg.icons.icHomeEventSelected.svg(),
            label: 'Sự kiện',
          ),
          BottomNavigationBarItem(
            icon: Assets.svg.icons.icHomeChat.svg(),
            activeIcon: Assets.svg.icons.icHomeChatSelected.svg(),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Assets.svg.icons.icHomeMore.svg(),
            activeIcon: Assets.svg.icons.icHomeMoreSelected.svg(),
            label: 'Thêm',
          ),
        ],
      ),
    );
  }
}
