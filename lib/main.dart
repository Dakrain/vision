import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/firebase_options.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
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
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kGreyscale3,
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                color: kPrimaryColor,
              ),
              titleTextStyle: TextStyle(
                fontSize: 16,
                color: kGreyscale80,
                fontWeight: FontWeight.w600,
              )),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: kGreyscale80),
            bodyMedium: TextStyle(color: kGreyscale80),
            bodySmall: TextStyle(color: kGreyscale80),
            displayLarge: TextStyle(color: kGreyscale80),
            displayMedium: TextStyle(color: kGreyscale80),
            displaySmall: TextStyle(color: kGreyscale80),
            headlineLarge: TextStyle(color: kGreyscale80),
            headlineMedium: TextStyle(color: kGreyscale80),
            headlineSmall: TextStyle(color: kGreyscale80),
            labelLarge: TextStyle(color: kGreyscale80),
            labelMedium: TextStyle(color: kGreyscale80),
            labelSmall: TextStyle(color: kGreyscale80),
            titleLarge: TextStyle(color: kGreyscale80),
            titleMedium: TextStyle(color: kGreyscale80),
            titleSmall: TextStyle(color: kGreyscale80),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.white,
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: kPrimaryColor,
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                side: const BorderSide(color: kPrimaryColor, width: 2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: kGreyscale3,
            filled: true,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: kGreyscale20,
            ),
            errorStyle: const TextStyle(
              fontSize: 12,
              color: kAlternateColorRed,
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          )),
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
