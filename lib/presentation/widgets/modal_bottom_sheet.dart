import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({
    super.key,
    required this.child,
    required this.title,
  });
  final Widget title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              child: title,
            ),
            const Divider(color: kGreyscale5, thickness: 1, height: 1),
            child
          ],
        ),
      ),
    );
  }
}
