import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TextfieldWithLabel extends StatefulWidget {
  const TextfieldWithLabel({
    super.key,
    required this.label,
    this.hintText,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.readOnly = false,
    this.errorMessage,
  });

  final String label;
  final String? hintText;
  final String? errorMessage;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final bool readOnly;

  @override
  State<TextfieldWithLabel> createState() => _TextfieldWithLabelState();
}

class _TextfieldWithLabelState extends State<TextfieldWithLabel> {
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    showPassword = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        const Gap(8),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          obscureText: showPassword,
          readOnly: widget.readOnly,
          decoration: InputDecoration(
            hintText: widget.hintText,
            errorText: widget.errorMessage,
            isDense: true,
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      showPassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
