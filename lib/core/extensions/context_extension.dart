import 'package:flutter/material.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:flutter_base_project/presentation/global/bloc/authentication_bloc.dart';
import 'package:flutter_base_project/presentation/global/cubit/config_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ContextX on BuildContext {
  User? get user => read<AuthenticationBloc>().state.mapOrNull(authenticated: (value) => value.user);

  Config? get config => read<ConfigCubit>().state.mapOrNull(success: (value) => value.data);

  bool get authenticated => user != null;

  Future<void> showDialog({Widget? title, Widget? content, List<Widget>? actions}) async {
    return showAdaptiveDialog(
      context: this,
      builder: (context) {
        return AlertDialog.adaptive(
          title: title,
          content: content,
          actions: actions,
        );
      },
    );
  }
}
