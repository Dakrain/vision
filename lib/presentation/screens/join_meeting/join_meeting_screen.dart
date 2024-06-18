import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:gap/gap.dart';

@RoutePage()
class JoinMeetingScreen extends StatelessWidget {
  const JoinMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tham gia cuộc họp')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tham gia với ID cuộc họp',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Gap(16),
                  const TextfieldWithLabel(
                    label: 'Meeting ID',
                    hintText: 'Meeting ID',
                  ),
                  const Gap(16),
                  const TextfieldWithLabel(
                    label: 'Passcode',
                    hintText: 'Passcode',
                  ),
                ],
              ),
            ),
            const Gap(8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              color: Colors.white,
              child: const TextfieldWithLabel(
                readOnly: true,
                label: 'Tên của bạn trong cuộc họp',
                hintText: 'Phan Văn Cao',
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.maxFinite,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(
              child: const Text('Tham gia'),
              onPressed: () {
                context.pushRoute(const WaitingRoomRoute());
              },
            ),
            const Gap(16),
            Text.rich(
              TextSpan(text: 'Nếu bạn nhận được ', children: [
                TextSpan(
                    text: 'đường liên kết lời mời',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: kGreyscale80, fontWeight: FontWeight.w500)),
                const TextSpan(
                    text: ', hãy chọn vào đường liên kết đó để vào cuộc họp')
              ]),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: kGreyscale50),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
