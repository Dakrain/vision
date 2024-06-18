import 'package:flutter/material.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(),
          prefixIcon: const Icon(Icons.search),
          hintText: hintText,
        ),
      ),
    );
  }
}
