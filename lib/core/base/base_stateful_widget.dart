// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({super.key});

  @override
  _BaseStatefulWidgetState createState() => _BaseStatefulWidgetState();

  void initState() {}

  void dispose() {}
}

class _BaseStatefulWidgetState extends State<BaseStatefulWidget> {
  @override
  void initState() {
    super.initState();
    widget.initState();
  }

  @override
  void dispose() {
    widget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
