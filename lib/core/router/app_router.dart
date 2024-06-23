import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../../presentation/screens/debug/debug_screen.dart';
import '../../presentation/screens/screens.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
@LazySingleton()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DebugRoute.page, initial: true),
        AutoRoute(page: SplashRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: LanguageRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: JoinMeetingRoute.page),
        AutoRoute(page: MeetingRoute.page),
        AutoRoute(page: ParticipantListRoute.page),
        AutoRoute(page: MeetingChatRoute.page),
        AutoRoute(page: MeetingSetupRoute.page),
        AutoRoute(page: WaitingRoomRoute.page),
        AutoRoute(page: AssignCohostRoute.page),
        AutoRoute(page: AddMembersRoute.page),
        AutoRoute(page: NewsDetailRoute.page),
        AutoRoute(page: ProductDetailRoute.page),
        AutoRoute(page: VideoRoute.page),
        AutoRoute(page: EventDetailRoute.page),
        AutoRoute(page: NewsRoute.page),
        AutoRoute(page: VideoDetailRoute.page),
        AutoRoute(page: ShopRoute.page),
        AutoRoute(page: VideoCategoryRoute.page),
      ];
}
