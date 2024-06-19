import 'package:flutter/material.dart';
import 'package:flutter_base_project/domain/entities/auth/user.dart';
import 'package:flutter_base_project/presentation/global/bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ContextX on BuildContext {
  User? get user => read<AuthenticationBloc>()
      .state
      .mapOrNull(authenticated: (value) => value.user);

  bool get authenticated => user != null;
}
