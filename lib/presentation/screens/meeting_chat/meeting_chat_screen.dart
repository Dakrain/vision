import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../theme/colors.dart';

@RoutePage()
class MeetingChatScreen extends StatelessWidget {
  const MeetingChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Tin nhắn trong cuộc họp'),
        titleTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                        child: const Text(
                            'Tin nhắn chỉ hiển thị với những người tham gia cuộc họp và sẽ bị xoá khi cuộc họp kết thúc')),
                    const Gap(24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 14,
                          backgroundImage: CachedNetworkImageProvider(
                              'https://media.themoviedb.org/t/p/w500/oVPsIKXOpz2cd73gDXhsUboD4xG.jpg'),
                        ),
                        const Gap(16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nguyen Van A',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500)),
                              const Gap(4),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                    color: kGreyscale5,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                    )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Chào mọi người, mình tên là Nguyễn Văn A, hiện tại mình đang sinh sống và làm việc tại TP. HCM.',
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                    const Gap(8),
                                    Text(
                                      '11:52',
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: kGreyscale50),
                                    )
                                  ],
                                ),
                              ),
                              const Gap(4),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                    color: kGreyscale5,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                    )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Mọi người cho em hỏi là mọi người họp lâu chưa ạ?',
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                    const Gap(8),
                                    Text(
                                      '11:52',
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: kGreyscale50),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: kShadowGreyscale,
                  offset: Offset(0, -4),
                  blurRadius: 8,
                  spreadRadius: 1,
                )
              ], color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: const Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nhập tin nhắn...',
                        isDense: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.image_outlined,
                    color: kGreyscale50,
                  ),
                  Gap(8),
                  Icon(
                    Icons.attach_file,
                    color: kGreyscale50,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
