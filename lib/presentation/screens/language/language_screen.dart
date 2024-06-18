import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/presentation/constants/decoration_constants.dart';
import 'package:flutter_base_project/presentation/screens/language/widgets/language_tile.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/widgets/button.dart';
import 'package:gap/gap.dart';

@RoutePage()
class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyscale3,
      body: SafeArea(
        child: Column(
          children: [
            const Gap(40),
            Center(
              child: Text(
                'Vui lòng chọn ngôn ngữ',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const Gap(30),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                separatorBuilder: (context, index) => const Gap(8),
                itemBuilder: (context, index) {
                  return LanguageTile(
                    title: 'English (United States)',
                    url:
                        'https://media.vision20.us/images/2021/26/08/bdae5cb636_d8154623e653e7de6bee5a8e49bb13d4.png',
                    selected: false,
                    onTap: () {},
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          kBoxShadow2,
        ]),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: PrimaryButton(
          child: const Text('Tiếp'),
          onPressed: () {
            context.navigateTo(const LoginRoute());
          },
        ),
      ),
    );
  }
}
