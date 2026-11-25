import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/app_router.gr.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/booking_text_field.dart';
import '../../../../core/widgets/box_widget.dart';
import '../../../../core/widgets/custom_floating_nav_bar.dart';
import '../../../../core/widgets/custom_floating_nav_bar_enum.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int _selectedTab = 0;

  final TextEditingController _emailPhoneSigninController =
      TextEditingController();
  final TextEditingController _passwordSigninController =
      TextEditingController();

  final TextEditingController _fNameSignupController = TextEditingController();
  final TextEditingController _lNameSignupController = TextEditingController();
  final TextEditingController _emailSignupController = TextEditingController();
  final TextEditingController _passwordSignupController =
      TextEditingController();

  @override
  void dispose() {
    _emailPhoneSigninController.dispose();
    _passwordSigninController.dispose();
    _fNameSignupController.dispose();
    _lNameSignupController.dispose();
    _emailSignupController.dispose();
    _passwordSignupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFloatingNavBar(
              currentIndex: _selectedTab,
              onTap: (index) => setState(() => _selectedTab = index),
              horizontalMargin: 0,
              height: 55,
              borderRadius: 15,
              backgroundColor: AppColors.secondary,
              borderColor: AppColors.white.withValues(alpha: 0.16),
              glowColor: AppColors.primary,
              glowWidth: MediaQuery.sizeOf(context).width * 0.4,
              glowPosition: NavGlowPosition.bottom,
              glowStyle: NavGlowStyle.glow,
              items: [
                FloatingNavItem(
                  child: Text(
                    'تسجيل الدخول',
                    style: AppTextStyles.font14Regular.copyWith(
                      color: AppColors.thirdColor,
                    ),
                  ),
                ),
                FloatingNavItem(
                  child: Text(
                    'انشاء حساب',
                    style: AppTextStyles.font14Regular.copyWith(
                      color: AppColors.thirdColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (_selectedTab == 0) ...[
              // Sign In Form
              BoxWidget(
                borderColor: AppColors.borderGrey,
                borderWidth: 0.7,
                color: AppColors.white,
                child: Column(
                  children: [
                    BookingTextField.outlined(
                      controller: _emailPhoneSigninController,
                      labelText: 'Email or Phone',
                      hintText: 'Enter Your Email or Phone',
                      hintColor: AppColors.primary,
                      labelColor: AppColors.primary,
                      borderColor: AppColors.primary,
                      fillColor: AppColors.white,
                      focusedBorderColor: AppColors.secondary,
                      borderWidth: 1.5,
                      borderRadius: 12,
                    ),
                    const SizedBox(height: 15),
                    BookingTextField.outlined(
                      controller: _passwordSigninController,
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      isPassword: true,
                      hintColor: AppColors.primary,
                      borderColor: AppColors.primary,
                      fillColor: AppColors.white,
                      labelColor: AppColors.primary,
                      focusedBorderColor: AppColors.secondary,
                      borderWidth: 1.5,
                      borderRadius: 12,
                    ),
                  ],
                ),
                verticalPadding: 12.0,
                horizontalPadding: 16.0,
              ),
            ] else ...[
              // Sign Up Form
              BoxWidget(
                child: Column(
                  children: [
                    BookingTextField.outlined(
                      controller: _fNameSignupController,
                      labelText: 'First Name',
                      hintText: 'Enter your first name',
                      hintColor: AppColors.primary,
                      labelColor: AppColors.primary,
                      borderColor: AppColors.primary,
                      fillColor: AppColors.white,
                      focusedBorderColor: AppColors.secondary,
                      borderWidth: 1.5,
                      borderRadius: 12,
                    ),
                    const SizedBox(height: 15),
                    BookingTextField.outlined(
                      controller: _lNameSignupController,
                      labelText: 'Last Name',
                      hintText: 'Enter your last name',
                      hintColor: AppColors.primary,
                      labelColor: AppColors.primary,
                      borderColor: AppColors.primary,
                      fillColor: AppColors.white,
                      focusedBorderColor: AppColors.secondary,
                      borderWidth: 1.5,
                      borderRadius: 12,
                    ),
                    const SizedBox(height: 15),
                    BookingTextField.outlined(
                      controller: _emailSignupController,
                      labelText: 'Email or Phone',
                      hintText: 'Enter Your Email or Phone',
                      hintColor: AppColors.primary,
                      labelColor: AppColors.primary,
                      borderColor: AppColors.primary,
                      fillColor: AppColors.white,
                      focusedBorderColor: AppColors.secondary,
                      borderWidth: 1.5,
                      borderRadius: 12,
                    ),
                    const SizedBox(height: 15),
                    BookingTextField.outlined(
                      controller: _passwordSignupController,
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      isPassword: true,
                      hintColor: AppColors.primary,
                      borderColor: AppColors.primary,
                      fillColor: AppColors.white,
                      labelColor: AppColors.primary,
                      focusedBorderColor: AppColors.secondary,
                      borderWidth: 1.5,
                      borderRadius: 12,
                    ),
                  ],
                ),
                verticalPadding: 12.0,
                horizontalPadding: 16.0,
              ),
            ],
            const SizedBox(height: 20),
            AppTextButton(
              buttonText: _selectedTab == 0 ? 'تسجيل الدخول' : 'انشاء حساب',
              backgroundColor: AppColors.secondary,
              borderRadius: 15,
              buttonHeight: 50,
              textStyle: AppTextStyles.font14MediumWhite.copyWith(
                color: AppColors.thirdColor,
              ),
              buttonWidth: double.infinity,
              onPressed: () {
                context.router.replaceAll([
                  MainShellRoute(children: [const HomeRoute()]),
                ]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
