import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/add_friend_cubit.dart';

class FindFriendByPhone extends StatefulWidget {
  const FindFriendByPhone({
    super.key,
  });

  @override
  State<FindFriendByPhone> createState() => _FindFriendByPhoneState();
}

class _FindFriendByPhoneState extends State<FindFriendByPhone> {
  final TextEditingController _phoneController = TextEditingController();
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
                  controller: _phoneController,
                  label: 'Số điện thoại',
                  hintText: 'Số điện thoại',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập số điện thoại';
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
                context.read<AddFriendCubit>().addFriendByPhoneNumber(_phoneController.text);
              },
            ),
          )
        ],
      ),
    );
  }
}
