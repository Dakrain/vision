import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/utils/validation_utils.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/add_friend_cubit.dart';

class FindFriendByEmail extends StatefulWidget {
  const FindFriendByEmail({
    super.key,
  });

  @override
  State<FindFriendByEmail> createState() => _FindFriendByEmailState();
}

class _FindFriendByEmailState extends State<FindFriendByEmail> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            color: Colors.white,
            child: Column(
              children: [
                TextfieldWithLabel(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  label: 'Email',
                  hintText: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập email';
                    } else if (!ValidationUtils.isValidEmail(value)) {
                      return 'Email không hợp lệ';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: PrimaryButton(
              child: const Text('Thêm liên hệ'),
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                context.read<AddFriendCubit>().addFriendByEmail(_emailController.text);
              },
            ),
          )
        ],
      ),
    );
  }
}
