import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/gen/assets.gen.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:gap/gap.dart';

@RoutePage()
class WaitingRoomScreen extends StatelessWidget {
  const WaitingRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyscale90,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 16,
                right: 16,
                child: CircleButton(
                  size: 40,
                  icon: Icons.phone,
                  backgroundColor: kPrimaryColor,
                  onPressed: () {
                    context.maybePop();
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.svg.images.imgSleepyPanda.svg(),
                  const Gap(40),
                  Text(
                    'Vui lòng đợi...',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
                  ),
                  const Gap(16),
                  Text(
                    'Người chủ trì cuộc họp sẽ sớm cho bạn vào phòng “Cuộc họp thường niên tháng 9”',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500, color: kGreyscale20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
