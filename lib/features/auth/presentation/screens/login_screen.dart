import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:panel_cartel/core/constants/assets.dart';
import 'package:panel_cartel/core/themes/themes.dart';
import 'package:panel_cartel/core/utils/toast.dart';
import 'package:panel_cartel/core/widgets/progress_widget.dart';
import 'package:panel_cartel/core/widgets/text_field_widget.dart';

import '../../../../core/widgets/button_widget.dart';
import '../../logic/cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: mediumRadius,
            ),
            width: 850,
            height: 500,
            child: Row(
              children: [
                // Right side with AuthCubit
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          svg_logo,
                          width: 60,
                        ),
                        SizedBox(
                          height: spacingSmall,
                        ),
                        const Text(
                          'کارتـــل ویــــژن',
                          style: TextStyle(
                            fontFamily: font_bold,
                            fontSize: txt_50,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: spacingMedium,
                        ),
                        Text(
                          'ورود به حساب کاربری',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: spacingThin,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text:
                            'برای دسترسی به داشبورد مدیریت، لطفاً وارد حساب کاربری خود شوید. اگر حساب کاربری ندارید، با ',
                            style: Theme.of(context).textTheme.headlineMedium,
                            children: [
                              const TextSpan(
                                text: 'مدیر سیستم',
                                style: TextStyle(
                                  fontFamily: font_bold,
                                  fontSize: txt_20,
                                  color: primaryColor,
                                ),
                              ),
                              TextSpan(
                                text: ' تماس بگیرید.',
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: spacingSmall,
                        ),
                        TextFieldWidget(
                          controller: _phoneController,
                          label: 'شماره موبایل',
                          inputType: TextInputType.phone,
                          maxEms: 11,
                        ),
                        const SizedBox(
                          height: spacingThin,
                        ),
                        TextFieldWidget(
                          controller: _passwordController,
                          inputType: TextInputType.visiblePassword,
                          isPassword: true,
                          label: 'رمزعبور',
                        ),
                        const SizedBox(
                          height: spacingLarg,
                        ),
                        BlocConsumer<AuthCubit, AuthState>(
                          listener: (context, state) {
                            if (state is AuthLoaded) {
                              showToast(context: context, message: 'ورود با موفقیت انجام شد.', type: ToastType.success);
                              print('Token: ${state.adminData['token']}');
                              print('Admin Info: ${state.adminData['admin']}');
                            } else if (state is AuthError) {
                              showToast(context: context, message: state.message, type: ToastType.error);
                            }
                          },
                          builder: (context, state) {
                            if (state is AuthLoading) {
                              return ProgressWidget(isButton: true,);
                            } else {
                              return ButtonWidget(
                                onPressed: () {
                                  final input = _phoneController.text;
                                  final password = _passwordController.text;
                                  context.read<AuthCubit>().login(input, password);
                                },
                                text: 'تایید و ورود',
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: spacingThin,
                        ),
                        TextButton(
                          onPressed: () {
                            final input = _phoneController.text;
                            final password = _passwordController.text;
                            context.read<AuthCubit>().login(input, password);
                          },
                          child: Text(
                            'فراموشی رمزعبور',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Left side
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radiusMedium),
                        bottomLeft: Radius.circular(radiusMedium),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
