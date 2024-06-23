import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/extensions/context_extension.dart';
import 'package:flutter_base_project/gen/assets.gen.dart';
import 'package:flutter_base_project/presentation/constants/decoration_constants.dart';
import 'package:flutter_base_project/presentation/global/bloc/authentication_bloc.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/widgets/avatar.dart';
import 'package:flutter_base_project/presentation/widgets/button.dart';
import 'package:flutter_base_project/presentation/widgets/section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                top: 16,
                left: 20,
                right: 20,
                bottom: 28,
              ),
              child: context.authenticated
                  ? Row(
                      children: [
                        Avatar(
                          url: context.user?.avatarUrl,
                          radius: 32,
                        ),
                        const Gap(16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(context.user?.fullName ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 20)),
                            Text(
                              context.user?.email ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w400, color: kGreyscale50),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            onPressed: () {},
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Assets.svg.icons.icUserCircle.svg(), const Gap(8), const Text('Đăng nhập')],
                            ),
                          ),
                        ),
                        const Gap(16),
                        Expanded(
                          child: SecondaryButton(
                            onPressed: () {},
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Assets.svg.icons.icLock.svg(), const Gap(8), const Text('Đăng ký')],
                            ),
                          ),
                        )
                      ],
                    ),
            ),
            const Gap(12),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildCard(context),
                _buildCard(context),
                _buildCard(context),
                _buildCard(context),
                _buildCard(context),
                _buildCard(context),
                _buildCard(context),
                _buildCard(context),
              ],
            ),
            Section(children: [
              Row(
                children: [
                  Assets.svg.icons.icStorage.svg(),
                  const Gap(8),
                  Expanded(
                      child: Text(
                    'Bộ nhớ (Đã sử dụng ${context.user?.percentageDrive}%)',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )),
                  const Gap(16),
                  const Icon(Icons.chevron_right, color: kGreyscale50)
                ],
              ),
              Row(
                children: [
                  Assets.svg.icons.icPolicy.svg(),
                  const Gap(8),
                  Expanded(
                      child: Text(
                    'Điều khoản và Điều kiện',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )),
                  const Gap(16),
                  const Icon(Icons.chevron_right, color: kGreyscale50)
                ],
              ),
              Row(
                children: [
                  Assets.svg.icons.icLanguages.svg(),
                  const Gap(8),
                  Expanded(
                      child: Text(
                    'Ngôn ngữ mặc định: Tiếng Việt',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )),
                  const Gap(16),
                  const Icon(Icons.chevron_right, color: kGreyscale50)
                ],
              ),
            ]),
            if (context.authenticated) ...[
              const Gap(24),
              Ink(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    context.read<AuthenticationBloc>().add(const AuthenticationEvent.logOut());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Đăng xuất',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w600, color: kPrimaryColor),
                    ),
                  ),
                ),
              ),
              const Gap(24)
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      width: (MediaQuery.sizeOf(context).width / 2) - 40,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        boxShadow: const [kBoxShadow2],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Assets.svg.icons.icDonate.svg(),
          const Gap(5),
          Text(
            'Dâng hiến',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
