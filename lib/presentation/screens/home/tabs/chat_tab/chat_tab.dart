import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/screens/home/tabs/chat_tab/tabs/contacts_tab/contacts_tab.dart';

import '../../../../theme/colors.dart';
import 'tabs/conversations_tab/conversations_tab.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Tin nhắn'),
            centerTitle: true,
            leading: const SizedBox(),
            titleTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            bottom: const TabBar(
                indicatorWeight: 1,
                labelPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                indicatorColor: kPrimaryColor,
                labelColor: Colors.black,
                indicatorPadding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: kGreyscale50,
                indicator: UnderlineTabIndicator(borderSide: BorderSide(color: kPrimaryColor, width: 2)),
                tabs: [
                  Tab(
                    text: 'Trò chuyện',
                  ),
                  Tab(
                    text: 'Danh bạ',
                  ),
                ])),
        body: const TabBarView(
          children: [
            ConversationsTab(),
            ContactsTab(),
          ],
        ),
      ),
    );
  }
}
