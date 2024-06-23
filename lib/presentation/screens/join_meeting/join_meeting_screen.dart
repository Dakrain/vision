import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/core/extensions/context_extension.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';

import 'bloc/join_meeting_bloc.dart';

@RoutePage()
class JoinMeetingScreen extends StatefulWidget {
  const JoinMeetingScreen({super.key});

  @override
  State<JoinMeetingScreen> createState() => _JoinMeetingScreenState();
}

class _JoinMeetingScreenState extends State<JoinMeetingScreen> {
  final TextEditingController _meetingIdController = TextEditingController();
  final TextEditingController _passcodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<JoinMeetingBloc>(),
      child: BlocConsumer<JoinMeetingBloc, JoinMeetingState>(
        listener: (context, state) {
          state.maybeMap(loading: (_) => EasyLoading.show(), orElse: () => EasyLoading.dismiss());

          state.whenOrNull(
            error: (error) => EasyLoading.showError(error.message ?? 'Something went wrong'),
            success: (meeting) => context.pushRoute(
              MeetingRoute(meetingInfo: meeting),
            ),
          );
        },
        builder: (context, state) {
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
                        TextfieldWithLabel(
                          controller: _meetingIdController,
                          label: 'Meeting ID',
                          hintText: 'Meeting ID',
                        ),
                        const Gap(16),
                        TextfieldWithLabel(
                          controller: _passcodeController,
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
                    child: TextfieldWithLabel(
                      readOnly: true,
                      label: 'Tên của bạn trong cuộc họp',
                      hintText: context.user?.fullName ?? '',
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
                      final meetingId = _meetingIdController.text;
                      final passcode = _passcodeController.text;

                      context.read<JoinMeetingBloc>().add(JoinMeetingEvent.joinMeeting(
                            meetingId,
                            passcode,
                          ));
                    },
                  ),
                  const Gap(16),
                  Text.rich(
                    TextSpan(text: 'Nếu bạn nhận được ', children: [
                      TextSpan(
                          text: 'đường liên kết lời mời',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: kGreyscale80, fontWeight: FontWeight.w500)),
                      const TextSpan(text: ', hãy chọn vào đường liên kết đó để vào cuộc họp')
                    ]),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: kGreyscale50),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
