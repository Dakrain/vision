import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/core/extensions/context_extension.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:flutter_base_project/gen/assets.gen.dart';
import 'package:flutter_base_project/presentation/screens/home/tabs/chat_tab/tabs/contacts_tab/contacts_tab.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../theme/colors.dart';
import 'tabs/contacts_tab/cubit/contact_cubit.dart';
import 'tabs/conversations_tab/conversations_tab.dart';
import 'tabs/conversations_tab/cubit/conversation_cubit.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      builder: (context) {
        return BottomSheetS(title: 'Thêm', children: [
          BottomSheetItem(
            onTap: () {
              context.maybePop();
              context.router.push(const AddFriendRoute());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kết bạn',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: kGreyscale80),
                ),
                Assets.svg.icons.icUserPlus.svg(colorFilter: const ColorFilter.mode(kGreyscale50, BlendMode.srcIn)),
              ],
            ),
          ),
          BottomSheetItem(
            onTap: () {
              context.maybePop();
              context.router.push(ListFriendRequestRoute(requestType: FriendCommand.requested));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lời mời kết bạn',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: kGreyscale80),
                ),
                Assets.svg.icons.icUserPlus.svg(colorFilter: const ColorFilter.mode(kGreyscale50, BlendMode.srcIn)),
              ],
            ),
          ),
          BottomSheetItem(
            onTap: () {
              context.maybePop();
              context.router.push(ListFriendRequestRoute(requestType: FriendCommand.blocked));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Danh sách chặn liên hệ',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: kGreyscale80),
                ),
                Assets.svg.icons.icCancel.svg(colorFilter: const ColorFilter.mode(kGreyscale50, BlendMode.srcIn)),
              ],
            ),
          ),
        ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userUuid = context.user?.identifier ?? '';
    final subscribeKey = context.config?.chat.subcribeKey ?? '';
    final publishKey = context.config?.chat.publishKey ?? '';
    final serverInboundChannel = context.config?.chat.serverInboundChannel ?? '';

    return DefaultTabController(
      length: 2,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => injector<ContactCubit>()..fetchContacts(),
          ),
          BlocProvider(
            create: (context) => injector<ConversationCubit>()
              ..getConversations(
                userUuid: userUuid,
                subscribeKey: subscribeKey,
                publishKey: publishKey,
                serverInboundChannel: serverInboundChannel,
                groupChannelId: context.user?.chat?.userGroupChannels ?? [],
              ),
          ),
        ],
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('Tin nhắn'),
              centerTitle: true,
              leading: const SizedBox(),
              titleTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              actions: [
                IconButton(
                  onPressed: () => _showBottomSheet(context),
                  icon: const Icon(Icons.menu),
                )
              ],
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
      ),
    );
  }
}
