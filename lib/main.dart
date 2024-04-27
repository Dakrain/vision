import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/firebase_options.dart';
import 'package:flutter_base_project/presentation/utilities/network_check_utilities.dart';
import 'package:flutter_base_project/presentation/utilities/toast_utilities.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

import 'generated/l10n.dart';

void main() async {
  // Ensure Flutter binding
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize GetIt for dependency injection
  GetIt getIt = GetIt.instance;

  await inject();

  // Initialize Flutter Local Notifications
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NetworkCheckUtilities networkCheckUtilities = NetworkCheckUtilities();
  networkCheckUtilities.listenToNetworkChange(
      noNetworkCallback: () => ToastUtilities.showToast(
            message:
                "Network Unavailable. Please check your connection and try again.",
            toastLength: Toast.LENGTH_LONG,
          ),
      gotNetworkCallback: () => ToastUtilities.showToast(
            message: "Network recovered.",
            toastLength: Toast.LENGTH_LONG,
          ));

  // Initialize Crashlytics
  if (!kDebugMode) {
    // Pass all uncaught errors to Crashlytics.
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = injector.get<AppRouter>();

    return MaterialApp.router(
      title: 'Flutter Base Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: appRouter.delegate(
        // deepLinkBuilder: (deepLink) {
        //   return const DeepLink([]);
        // },
        navigatorObservers: () => [NavigatorObserver()],
      ),
      routeInformationParser: appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
