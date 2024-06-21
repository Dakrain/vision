import 'dart:developer';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_rtm/agora_rtm.dart';

const appId = 'c2c92894c294415d9af39e31bcec8832';

@singleton
class AgoraProvider {
  late final RtcEngine engine;
  late final AgoraRtmClient rtmClient;

  // appId: '0e1f9be6933e40de8a455bc0812a2bf7',

  Future<void> initEngine() async {
    engine = createAgoraRtcEngine();
    if (Platform.isAndroid && Platform.isIOS) {
      rtmClient = await AgoraRtmClient.createInstance(appId);

      rtmClient.onConnectionStateChanged2 = (state, reason) {
        log('🚀[onConnectionStateChanged2] state: ${state.toJson()} reason: ${reason.toJson()}');
      };
    }
    await engine.initialize(const RtcEngineContext(appId: appId));
  }

  Future<void> joinChannel() async {
    // engine.joinChannel(
    //     token: token, channelId: channelId, uid: uid, options: options);
  }
}
