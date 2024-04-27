import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

@RoutePage()
class DebugScreen extends StatefulWidget {
  const DebugScreen({super.key});

  @override
  State<DebugScreen> createState() => _DebugScreenState();
}

class _DebugScreenState extends State<DebugScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [TextButton(onPressed: () {}, child: Text('Debug 1'))],
        ),
      ),
    );
  }
}
