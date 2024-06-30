import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/core/utils/date_utils.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:flutter_base_project/presentation/screens/home/tabs/chat_tab/tabs/conversations_tab/cubit/conversation_cubit.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ConversationsTab extends StatelessWidget {
  const ConversationsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationCubit, BasicState<Paging<Conversation>>>(
      builder: (context, state) {
        return state.maybeMap(
            success: (state) {
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                  thickness: 1,
                  color: kGreyscale5,
                ),
                itemCount: state.data.rows.length,
                itemBuilder: (context, index) {
                  final conversation = state.data.rows[index];
                  return GestureDetector(
                    onTap: () {
                      context.pushRoute(ChatRoute(
                          chatUser: conversation.inforDirect,
                          channelId: conversation.from?.channel ?? '',
                          name: conversation.from?.subject ?? 'Chat'));
                    },
                    child: ConversationItem(
                      avatarUrl: '',
                      subject: conversation.from?.subject ?? '',
                      missedMessages: conversation.totalMissedMessage ?? 0,
                      lastMessage: conversation.lastMessage ?? '',
                      time: conversation.time ?? 0,
                    ),
                  );
                },
              );
            },
            loading: (_) => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
            orElse: () => const SizedBox());
      },
    );
  }
}

class ConversationItem extends StatelessWidget {
  const ConversationItem({
    super.key,
    required this.subject,
    this.missedMessages = 0,
    required this.lastMessage,
    this.time = 0,
    required this.avatarUrl,
  });

  final String subject;
  final String avatarUrl;
  final String lastMessage;
  final int missedMessages;
  final int time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              Avatar(
                url: avatarUrl,
                radius: 24,
              ),
              const Gap(16),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            subject,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            lastMessage,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w400, color: kGreyscale50),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          DateTimeUtils.getFormattedDateFromTimestamp(time, 'dd/MM/yyyy'),
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: kGreyscale50),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryColor,
                          ),
                          child: Text(
                            missedMessages.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
