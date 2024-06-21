import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/core/extensions/context_extension.dart';
import 'package:flutter_base_project/data/providers/agora.provider.dart';
import 'package:flutter_base_project/presentation/widgets/avatar.dart';

class LocalVideoView extends StatefulWidget {
  const LocalVideoView({super.key});

  @override
  State<LocalVideoView> createState() => _LocalVideoViewState();
}

class _LocalVideoViewState extends State<LocalVideoView> {
  double bottom = 20;
  double right = 20;

  double initX = 0;
  double initY = 0;

  void _handleDrag(DragStartDetails details) {
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  void _handleUpdate(DragUpdateDetails details) {
    final double dx = initX - details.globalPosition.dx;
    final double dy = initY - details.globalPosition.dy;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    setState(() {
      bottom = bottom + dy;
      right = right + dx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: bottom,
        right: right,
        child: Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: Colors.white, width: 1),
          ),
          clipBehavior: Clip.hardEdge,
          width: MediaQuery.sizeOf(context).width / 3,
          height: MediaQuery.sizeOf(context).height / 4,
          child: Stack(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(1),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    shape: BoxShape.circle,
                  ),
                  child: Avatar(
                    url: context.user?.avatarUrl,
                  ),
                ),
              ),
              AgoraVideoView(
                controller: VideoViewController(
                  rtcEngine: injector<AgoraProvider>().engine,
                  canvas: const VideoCanvas(uid: 0),
                ),
              )
            ],
          ),
        ));
  }
}
