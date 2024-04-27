import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../presentation/screens/debug/debug_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
@LazySingleton()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes =>
      [AutoRoute(page: DebugRoute.page, initial: true)];
}
