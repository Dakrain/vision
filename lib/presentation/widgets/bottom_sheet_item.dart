import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({super.key, required this.child, this.onTap});
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          color: kGreyscale5,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: child,
      ),
    );
  }
}
