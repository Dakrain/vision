import 'dart:developer';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/router/app_router.dart';

import '../../../core/di/injection.dart';
import '../../../data/providers/agora.provider.dart';

@RoutePage()
class DebugScreen extends StatefulWidget {
  const DebugScreen({super.key});

  @override
  State<DebugScreen> createState() => _DebugScreenState();
}

class _DebugScreenState extends State<DebugScreen> {
  RtcEngine get engine => injector<AgoraProvider>().engine;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Expanded(
            //   child: AgoraVideoView(
            //       controller: VideoViewController.remote(
            //           connection: const RtcConnection(channelId: 'hehehe'),
            //           useAndroidSurfaceView: true,
            //           rtcEngine: engine,
            //           canvas: const VideoCanvas(uid: 3945764078))),
            // ),

            TextButton(
                onPressed: () {
                  context.navigateTo(const LanguageRoute());
                },
                child: const Text('Debug 1')),
          ],
        ),
      ),
    );
  }
}
