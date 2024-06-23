import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/core/extensions/context_extension.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/presentation/screens/meeting_setup/bloc/meeting_setup_bloc.dart';
import 'package:flutter_base_project/presentation/widgets/section.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/utilities/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';

@RoutePage()
class MeetingSetupScreen extends StatelessWidget {
  const MeetingSetupScreen({
    super.key,
    required this.isEdit,
    this.scheduleMeeting = false,
  });

  final bool isEdit;
  final bool scheduleMeeting;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<MeetingSetupBloc>(),
      child: BlocConsumer<MeetingSetupBloc, MeetingSetupState>(
        listener: (context, state) {
          state.maybeWhen(
            loading: (_) {
              EasyLoading.show();
            },
            orElse: () {
              EasyLoading.dismiss();
            },
          );

          state.whenOrNull(
            success: (meeting, meetingInfo) {
              context.navigateTo(MeetingRoute(meetingInfo: meetingInfo));
            },
            error: (meeting, error) {
              EasyLoading.showError(error.message ?? 'Something went wrong');
            },
          );
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Cài đặt cuộc họp'),
              actions: [
                MaterialButton(
                  onPressed: () {
                    context.read<MeetingSetupBloc>().add(const MeetingSetupEvent.createMeeting());
                  },
                  child: Text(
                    'Xong',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Section(
                    title: 'CHỦ ĐỀ CUỘC HỌP',
                    withPadding: false,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'CHỦ ĐỀ CUỘC HỌP',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: kPrimaryColor),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Section(
                    title: 'THÔNG TIN CUỘC HỌP',
                    children: [
                      if (scheduleMeeting)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Thời gian bắt đầu',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Text(
                                    '09:30, T4, 09/9/2021',
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: kGreyscale50),
                                  ),
                                  const Icon(
                                    Icons.chevron_right,
                                    color: kGreyscale50,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Người chủ trì',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            context.user?.fullName ?? '',
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        ],
                      ),
                      if (isEdit) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ID Cuộc họp',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              '567890',
                              style: Theme.of(context).textTheme.bodyLarge,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mật khẩu',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              '12345678',
                              style: Theme.of(context).textTheme.bodyLarge,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Link chia sẻ',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              'com.abc.xyz',
                              style: Theme.of(context).textTheme.bodyLarge,
                            )
                          ],
                        )
                      ],
                    ],
                  ),
                  Section(
                    title: 'CÀI ĐẶT CHO NGƯỜI THAM DỰ',
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Số lượng người tối đa',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Text(
                                  state.meeting.limitUser.toString(),
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: kGreyscale50),
                                ),
                                const Icon(
                                  Icons.chevron_right,
                                  color: kGreyscale50,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Kích hoạt phòng chờ xét duyệt',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Switch(
                              value: state.meeting.waitingRoom == 1,
                              onChanged: (value) {
                                context.read<MeetingSetupBloc>().add(MeetingSetupEvent.changedWaitingRoom(value));
                              })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Được phép mở Micrô',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Switch(
                              value: state.meeting.enableAudio == 1,
                              onChanged: (value) {
                                context.read<MeetingSetupBloc>().add(MeetingSetupEvent.changedAudio(value));
                              })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Được phép mở Webcam',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Switch(
                              value: state.meeting.enableVideo == 1,
                              onChanged: (value) {
                                context.read<MeetingSetupBloc>().add(MeetingSetupEvent.changedVideo(value));
                              })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Được phép Ghi âm',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Switch(
                              value: state.meeting.isRecording == 1,
                              onChanged: (value) {
                                context.read<MeetingSetupBloc>().add(MeetingSetupEvent.changedAllowRecord(value));
                              })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Được phép Chat',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Switch(
                              value: state.meeting.enableChat == 1,
                              onChanged: (value) {
                                context.read<MeetingSetupBloc>().add(MeetingSetupEvent.changedAllowChat(value));
                              })
                        ],
                      )
                    ],
                  ),
                  Section(
                    title: 'TRAO QUYỀN CO-HOST',
                    subTitle: 'Trao quyền co-host để giúp cho bạn dể dàng chuyển host cho cuộc họp',
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.navigateTo(const AssignCohostRoute());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Người được trao quyền co-host',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Row(
                              children: [
                                Text(
                                  '6',
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: kGreyscale50),
                                ),
                                const Icon(
                                  Icons.chevron_right,
                                  color: kGreyscale50,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      context.navigateTo(const AddMembersRoute());
                    },
                    child: Container(
                      width: double.maxFinite,
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Text(
                        'Thêm người vào phòng',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: kPrimaryColor),
                      ),
                    ),
                  ),
                  Section(
                    title: 'CÀI ĐẶT LƯU TRỮ',
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Lưu trữ file ghi âm',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: kGreyscale50,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ].separated(const Gap(24)),
              ),
            ),
          );
        },
      ),
    );
  }
}
