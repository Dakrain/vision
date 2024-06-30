import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/core/utils/date_utils.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:flutter_base_project/presentation/screens/list_friend_request/cubit/list_request_cubit.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';

@RoutePage()
class ListFriendRequestScreen extends StatelessWidget {
  const ListFriendRequestScreen({
    super.key,
    this.requestType = FriendCommand.requested,
  });

  final FriendCommand requestType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          requestType == FriendCommand.requested ? 'Lời mời kết bạn' : 'Danh sách chặn liên hệ',
        ),
      ),
      body: BlocProvider(
        create: (context) => injector<ListRequestCubit>()..getListRequest(requestType),
        child: BlocConsumer<ListRequestCubit, ListRequestState>(
          listener: (context, state) {
            state.maybeMap(
              loading: (_) => EasyLoading.show(),
              orElse: () => EasyLoading.dismiss(),
            );
          },
          builder: (context, state) {
            return state.maybeMap(
              initial: (_) => const Center(child: CircularProgressIndicator.adaptive()),
              orElse: () {
                if (state.contacts.rows.isEmpty) {
                  return const Center(child: Text('Danh sách trống'));
                }

                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(height: 1, color: kGreyscale10),
                  itemCount: state.contacts.rows.length,
                  padding: const EdgeInsets.only(top: 8),
                  itemBuilder: (context, index) {
                    final contact = state.contacts.rows[index];
                    return Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: Row(
                        children: [
                          Avatar(
                            url: contact.user.avatarUrl,
                            radius: 24,
                          ),
                          const Gap(16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    text: TextSpan(
                                        text: contact.user.fullName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(fontWeight: FontWeight.w500),
                                        children: [
                                      TextSpan(
                                          text: ' đã gửi lời mời kết bạn',
                                          style: Theme.of(context).textTheme.bodyMedium)
                                    ])),
                                Text(DateTimeUtils.getFormattedDateFromTimestamp(
                                  contact.friend.createdAt,
                                  'HH:mm - dd/MM/yyyy',
                                ))
                              ],
                            ),
                          ),
                          const Gap(16),
                          Material(
                            child: Ink(
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: InkWell(
                                onTap: () {
                                  context.read<ListRequestCubit>().acceptRequest(contact);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                  child: Text(
                                    'Xác nhận',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(height: 0, fontWeight: FontWeight.w500, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Gap(4),
                          Material(
                            child: Ink(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: kGreyscale20),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: InkWell(
                                onTap: () {
                                  context.read<ListRequestCubit>().rejectRequest(contact);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                  child: Text(
                                    'Xóa',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(height: 0, fontWeight: FontWeight.w500, color: kGreyscale80),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
