import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.child, this.onPressed, this.height});
  final Widget child;
  final void Function()? onPressed;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.maxFinite,
        minHeight: height ?? 48,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {super.key, required this.child, this.onPressed, this.height});
  final Widget child;
  final void Function()? onPressed;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.maxFinite,
        minHeight: height ?? 48,
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

class SvgCircleButton extends StatelessWidget {
  const SvgCircleButton({
    super.key,
    required this.child,
    this.backgroundColor = kPrimaryColor,
    this.onPressed,
  });

  final Widget child;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          backgroundColor: backgroundColor,
        ),
        child: child,
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? size;
  final VoidCallback? onPressed;

  const CircleButton({
    super.key,
    required this.icon,
    this.backgroundColor,
    this.iconColor,
    this.size,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 48,
      height: size ?? 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
        ),
        child: Icon(
          icon,
          color: iconColor ?? Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
