import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class VideoCategoryScreen extends StatelessWidget {
  const VideoCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Video Category'),
        ),
        body: const Center(
          child: Text('Video Category'),
        ));
  }
}
