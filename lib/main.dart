import 'dart:developer';
import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/firebase_options.dart';
import 'package:flutter_base_project/presentation/global/bloc/authentication_bloc.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/utilities/network_check_utilities.dart';
import 'package:flutter_base_project/presentation/utilities/toast_utilities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'data/providers/agora.provider.dart';
import 'generated/l10n.dart';

final appRouter = injector.get<AppRouter>();
void main() async {
  // Ensure Flutter binding
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  if (!Platform.isWindows) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  await inject();

  await injector<AgoraProvider>().initEngine();

  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..maskType = EasyLoadingMaskType.black
    ..indicatorColor = Colors.white
    ..backgroundColor = Colors.white
    ..textColor = kGreyscale80
    ..radius = 8
    ..contentPadding = const EdgeInsets.all(32)
    ..indicatorWidget = LoadingAnimationWidget.prograssiveDots(color: kPrimaryColor, size: 48);

  if (kDebugMode) {
    Bloc.observer = const AppBlocObserver();
  }

  // Initialize Flutter Local Notifications
  FlutterLocalNotificationsPlugin _ = FlutterLocalNotificationsPlugin();

  NetworkCheckUtilities networkCheckUtilities = NetworkCheckUtilities();
  networkCheckUtilities.listenToNetworkChange(
      noNetworkCallback: () => ToastUtilities.showToast(
            message: "Network Unavailable. Please check your connection and try again.",
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

  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) => injector()..add(const AuthenticationEvent.authenticateStarted()),
    child: BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        appRouter.push(state.map(
            unAuthenticated: (_) => const LoginRoute(),
            authenticated: (_) => const HomeRoute(),
            authenticating: (_) => const DebugRoute()));
      },
      child: DevicePreview(
        enabled: true,
        builder: (context) => const MyApp(),
      ),
    ),
  ));
}

class AppBlocObserver extends BlocObserver {
  /// {@macro app_bloc_observer}
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('🚀${bloc.runtimeType}: ${change.toString()}');
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    log('🚀${bloc.runtimeType}: ${transition.toString()}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('🚀${bloc.runtimeType}: ${error.toString()}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('🚀${bloc.runtimeType}: ${event.toString()}');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('🚀${bloc.runtimeType}: Created');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('🚀${bloc.runtimeType}: Closed');
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class _MyAppState extends State<MyApp> {
  @override
  void reassemble() {
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Vision 20',
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
          dialogBackgroundColor: Colors.white,
          primaryColorLight: Colors.yellow,
          platform: TargetPlatform.iOS,
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
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: kPrimaryColor,
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                side: const BorderSide(color: kPrimaryColor, width: 2),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
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
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 1,
                color: kAlternateColorRed,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.black,
              ),
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
      locale: DevicePreview.locale(context),
      builder: (context, child) {
        EasyLoading.init();
        return DevicePreview.appBuilder(context, FlutterEasyLoading(child: child));
      },
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
