import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/core/extensions/context_extension.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:flutter_base_project/presentation/screens/add_friend/cubit/add_friend_cubit.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'widgets/find_friend_by_email.dart';
import 'widgets/find_friend_by_phone.dart';

@RoutePage()
class AddFriendScreen extends StatelessWidget {
  const AddFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<AddFriendCubit>(),
      child: BlocListener<AddFriendCubit, BasicState<User>>(
        listener: (context, state) {
          state.maybeMap(
            loading: (_) => EasyLoading.show(),
            orElse: () => EasyLoading.dismiss(),
          );

          state.maybeMap(
            success: (state) {
              context.showDialog(title: const Text('Thêm liên hệ thành công'), actions: [
                TextButton(
                  onPressed: () {
                    context.router.maybePop();
                  },
                  child: const Text('OK'),
                )
              ]);
            },
            failure: (state) {
              context.showDialog(
                  title: const Text('Thêm liên hệ thất bại'),
                  content: Text(state.error.message ?? ''),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.router.maybePop();
                      },
                      child: const Text('OK'),
                    )
                  ]);
            },
            orElse: () {},
          );
        },
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                title: const Text('Kết bạn'),
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
                        text: 'Bằng số điện thoại',
                      ),
                      Tab(
                        text: 'Bằng email',
                      ),
                    ]),
              ),
              body: const TabBarView(children: [
                FindFriendByPhone(),
                FindFriendByEmail(),
              ])),
        ),
      ),
    );
  }
}
