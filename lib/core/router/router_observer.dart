import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const tag = 'Navigator';

class RouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (!kReleaseMode) {
      log('didPush from ${previousRoute?.settings.name} to ${route.settings.name}', name: tag);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (!kReleaseMode) {
      log('didPop ${route.settings.name}, back to ${previousRoute?.settings.name}', name: tag);
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    if (!kReleaseMode) {
      log('didRemove ${route.settings.name}, back to ${previousRoute?.settings.name}', name: tag);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (!kReleaseMode) {
      log('didReplace ${oldRoute?.settings.name} by ${newRoute?.settings.name}', name: tag);
    }
  }
}
