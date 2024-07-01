import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/core/extensions/context_extension.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:flutter_base_project/presentation/constants/decoration_constants.dart';
import 'package:flutter_base_project/presentation/screens/chat/bloc/chat_bloc.dart';
import 'package:flutter_base_project/presentation/screens/chat/widgets/chat_item.dart';
import 'package:flutter_base_project/presentation/screens/chat/widgets/header.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.channelId, required this.name, required this.chatUser});
  final String channelId;
  final String name;
  final User? chatUser;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final controller = TextEditingController();

  late ChatBloc bloc;
  @override
  void initState() {
    super.initState();
    initChat();
  }

  Future<void> initChat() async {
    bloc = injector();

    final userUuid = context.user?.identifier ?? '';
    final subscribeKey = context.config?.chat.subcribeKey ?? '';
    final publishKey = context.config?.chat.publishKey ?? '';
    final serverInboundChannel = context.config?.chat.serverInboundChannel ?? '';

    bloc.add(ChatEventStarted(
      userUuid: userUuid,
      subscribeKey: subscribeKey,
      publishKey: publishKey,
      serverInboundChannel: serverInboundChannel,
      channelId: widget.channelId,
    ));
  }

  Future<void> submitChat() async {
    final message = controller.text;
    final user = context.user;
    final userUuid = context.user?.identifier ?? '';
    final serverInboundChannel = context.config?.chat.serverInboundChannel ?? '';
    final chat = Chat(
      uuid: userUuid,
      timetoken: DateTime.now().millisecond,
      msg: message,
      msgType: 'text',
      user: user,
    );

    bloc.add(ChatEventChat(widget.channelId, serverInboundChannel, chat));

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final userUuid = context.user?.identifier ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<ChatBloc, ChatState>(
          bloc: bloc,
          builder: (context, state) {
            return state.maybeMap(
                loading: (value) => const Center(child: CircularProgressIndicator.adaptive()),
                orElse: () => const SizedBox(),
                success: (state) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: state.chats.length + 1,
                          reverse: true,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                          separatorBuilder: (context, index) => const Gap(8),
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Header(user: widget.chatUser);
                            }

                            final list = state.chats.reversed.toList();
                            final chat = list[index - 1];

                            return ChatItem(
                              chat: chat,
                              isMe: chat.user?.identifier == userUuid,
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: const BoxDecoration(
                          boxShadow: [kBoxShadow2],
                          color: Colors.white,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: kGreyscale5,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: controller,
                                  onFieldSubmitted: (_) => submitChat(),
                                  decoration: InputDecoration(
                                    hintText: 'Nhập tin nhắn...',
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: false,
                                    isDense: true,
                                    isCollapsed: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(16),
                              GestureDetector(
                                  onTap: submitChat, child: const Icon(Icons.send_rounded, color: kPrimaryColor))
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}

const tester1Json = {
  "id": 266,
  "created_at": 1668857237,
  "identifier": "22.1232131212313213.1668857237",
  "first_name": "12321312",
  "last_name": "12313213",
  "full_name": "1232131212313213",
  "phone": "",
  "phone_code": "",
  "email": "tester1@gmail.com",
  "avatar": 0,
  "gender": -1,
  "birthday": 0,
  "organization": "",
  "job": "",
  "position": "",
  "country_id": 0,
  "prefecture_id": 0,
  "postal_code": "",
  "forte": "",
  "religion": "",
  "avatar_url": "",
  "country_name": "",
  "prefecture_name": "",
  "drive": {
    "package_id": 1,
    "package_name": "standard",
    "storage_limit": 5368709120,
    "storage_used": 0,
    "storage_remain": 5368709120
  },
  "meeting": {"is_host": 1},
  "chat": {
    "user_group_channels": ["cg.22.1232131212313213.1668857237"]
  },
  "settings": {"language": "vn"},
  "access_token":
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI0ZTU4YTc3YjAwNzhlZGYyMmRkM2M5ZjYzZWI0OWJlZTZjOGMyYTY5ZDJkNDZkNzFlNWExODEzZmU5NDY1ZDExIiwidHlwZSI6ImFjY2Vzc190b2tlbiIsInRpbWUiOjE3MTk1NDc0MDI2NjQsImlhdCI6MTcxOTU0NzQwMiwiZXhwIjoxNzI0NzMxNDAyfQ.309xXFsf6BK8GxYSi2pykPlkyMu7xlN-QgG6-GvN4-s"
};

const tester2Json = {
  "id": 267,
  "created_at": 1668876428,
  "identifier": "22.234234234234234234.1668876428",
  "first_name": "23423423",
  "last_name": "4234234234",
  "full_name": "234234234234234234",
  "phone": "",
  "phone_code": "",
  "email": "tester2@gmail.com",
  "avatar": 0,
  "gender": -1,
  "birthday": 0,
  "organization": "",
  "job": "",
  "position": "",
  "country_id": 0,
  "prefecture_id": 0,
  "postal_code": "",
  "forte": "",
  "religion": "",
  "avatar_url": "",
  "country_name": "",
  "prefecture_name": "",
  "drive": {
    "package_id": 1,
    "package_name": "standard",
    "storage_limit": 5368709120,
    "storage_used": 0,
    "storage_remain": 5368709120
  },
  "meeting": {"is_host": 1},
  "chat": {
    "user_group_channels": ["cg.22.234234234234234234.1668876428"]
  },
  "settings": {"language": "vn"},
  "access_token":
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI5MzA3ZDRkMGI5Yzg4NDhkNTkzMTNjZDlhNGFjODMyZDRmYzhmMTkzZGE2ODI0OGY5ZWI4NjAxMmUwMWU2MTc2IiwidHlwZSI6ImFjY2Vzc190b2tlbiIsInRpbWUiOjE3MTk1NDc0OTMxOTAsImlhdCI6MTcxOTU0NzQ5MywiZXhwIjoxNzI0NzMxNDkzfQ.cgwqBx78V8mZhelM2iYCkcksnTiuK4bZTUdksFWv0Tk"
};
