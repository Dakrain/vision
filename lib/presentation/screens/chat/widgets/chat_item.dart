import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/utils/date_utils.dart';
import 'package:flutter_base_project/domain/entities/chat/chat.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:gap/gap.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.chat, required this.isMe});
  final Chat chat;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    const senderBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(16),
      bottomLeft: Radius.circular(16),
      bottomRight: Radius.circular(16),
    );

    const receiverBorderRadius = BorderRadius.only(
      topRight: Radius.circular(16),
      bottomLeft: Radius.circular(16),
      bottomRight: Radius.circular(16),
    );

    return SizedBox(
      width: double.maxFinite,
      child: Stack(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isMe)
                Avatar(
                  url: chat.user?.avatarUrl,
                  radius: 14,
                ),
              const Gap(16),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: isMe ? senderBorderRadius : receiverBorderRadius,
                  color: isMe ? kPrimaryColor.withOpacity(0.2) : kGreyscale3,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.msg,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    const Gap(8),
                    Text(DateTimeUtils.getFormattedDateFromTimestamp(chat.timetoken, 'HH:mm')),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
