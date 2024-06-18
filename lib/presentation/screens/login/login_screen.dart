import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/gen/assets.gen.dart';
import 'package:flutter_base_project/presentation/global/bloc/authentication_bloc.dart';
import 'package:flutter_base_project/presentation/screens/login/bloc/login_bloc.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/utilities/validators.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/widgets.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'hai22@gmail.com');
  final _passwordController = TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => injector(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          state.maybeMap(
              orElse: () => EasyLoading.dismiss(),
              loading: (_) => EasyLoading.show(),
              success: (state) {
                EasyLoading.dismiss();

                final user = state.user;

                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationEvent.authenticated(user));
              });
        },
        builder: (context, state) {
          final String? errorMessage =
              state.mapOrNull(error: (state) => state.error.message);

          return Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              top: false,
              child: Column(
                children: [
                  Assets.images.loginBackground.image(
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    width: double.maxFinite,
                    fit: BoxFit.fill,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 24,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Text(
                              'Đăng nhập',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            )),
                            TextfieldWithLabel(
                              controller: _emailController,
                              errorMessage: errorMessage,
                              label: 'Email',
                              hintText: 'Email',
                              validator: Validators.validateEmail,
                            ),
                            const Gap(16),
                            TextfieldWithLabel(
                              controller: _passwordController,
                              label: 'Mật khẩu',
                              hintText: 'Mật khẩu',
                              obscureText: true,
                              validator: Validators.validatePassword,
                            ),
                            const Gap(18),
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  'Quên mật khẩu',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(2),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 16,
                    ),
                    child: Wrap(
                      runSpacing: 16,
                      children: [
                        PrimaryButton(
                          child: const Text('Đăng nhập'),
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              final email = _emailController.text;
                              final password = _passwordController.text;

                              context.read<LoginBloc>().add(LoginEvent.login(
                                  email: email, password: password));
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Chưa có tài khoản?',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const Gap(8),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Tạo tài khoản',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        if (Platform.isIOS)
                          Center(
                            child: InkWell(
                              onTap: () {
                                context.navigateTo(const HomeRoute());
                              },
                              child: Text(
                                'Tiếp tục như  khách',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: kGreyscale5),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
