import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart' as local;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:standard_project/src/extenssions/int_extenssion.dart';
import 'package:standard_project/src/extenssions/widget_extensions.dart';
import 'package:standard_project/src/features/auth/verification_code/presentation/controller/verification_code_controller.dart';
import 'package:standard_project/src/routing/app_router.gr.dart';
import 'package:standard_project/src/shared_widgets/custom_back_arrow_widget.dart';
import 'package:standard_project/src/theme/app_colors.dart';
import '../../../../../shared_widgets/app_dialogs.dart';
import '../../../../../shared_widgets/custom_button_widget.dart';
import '../../../../../shared_widgets/fade_circle_loading_indicator.dart';

@RoutePage()
class VerificationScreen extends ConsumerWidget {
  final String inputedPhone;
  VerificationScreen({super.key, required this.inputedPhone});

  final TextEditingController pinController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verificationState = ref.watch(verificationCodeControllerProvider);
    final verificationController =
        ref.read(verificationCodeControllerProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.lightPeach,
      resizeToAvoidBottomInset: true,
      appBar: _buildAppBar(context),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      150.verticalSpace,
                      _buildHeader(context, inputedPhone),
                      32.verticalSpace,
                      _buildOtpInputField(verificationController, context),
                      // 16.verticalSpace,
                      // _buildVerificationState(verificationState),
                      16.verticalSpace,
                      _buildResendOtpSection(ref),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                _buildConfirmSignInButton(context, ref, verificationState),
                16.verticalSpace,
                _buildPrivacyAndPolicyCondition(context),
                50.verticalSpace,
              ],
            ),
          ],
        ).symmetricPadding(horizontal: 18),
      ),
    );
  }

  Widget _buildOtpInputField(
      VerificationCodeController verificationController, BuildContext context) {
    return Pinput(
      length: 6,
      controller: pinController,
      keyboardType: TextInputType.number,
      defaultPinTheme: PinTheme(
        height: 60,
        width: 60,
        textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
          border: Border.all(color: AppColors.grayBorder),
        ),
      ),
      validator: (value) => value == null || value.isEmpty
          ? context.tr("VerificationCodeValidatorMessage")
          : null,
      onCompleted: (s) => verificationController.verifyOtp(
        pinController.text,
        inputedPhone,
        context,
      ),
    );
  }

  Widget _buildVerificationState(AsyncValue verificationState) {
    return verificationState.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, _) => Text(
        "خطأ: $error",
        style: const TextStyle(color: Colors.red),
      ),
      data: (result) => result == "Success"
          ? const Text(
              "تم التحقق بنجاح",
              style: TextStyle(color: Colors.green),
            )
          : Text(
              "خطأ",
              style: const TextStyle(color: Colors.red),
            ),
    );
  }

  Widget _buildResendOtpSection(WidgetRef ref) {
    return Consumer(
      builder: (context, ref, _) {
        final verificationController =
            ref.watch(verificationCodeControllerProvider.notifier);
        return Column(
          children: [
            Text(
              verificationController.countdown > 0
                  ? "00:${verificationController.countdown.toString().padLeft(2, '0')}"
                  : "",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.grey600,
                  ),
            ),
            TextButton(
              onPressed: verificationController.canResend
                  ? () => verificationController.resendOtp(inputedPhone)
                  : null,
              child: Text(
                context.tr("resend_code"),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: verificationController.canResend
                          ? AppColors.primary
                          : AppColors.grey600,
                    ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildConfirmSignInButton(
      BuildContext context, WidgetRef ref, verificationState) {
    return Consumer(
      builder: (context, ref, child) {
        ref.listen(verificationCodeControllerProvider, (prev, next) {
          if (next is AsyncData && next.value == "Success") {
            debugPrint("✅ OTP Verification Successful!");

            // ✅ Navigate to Main Screen on success
            context.router.replaceAll([const MainRoute()]);
          } else if (next is AsyncError) {
            // ❌ Show error dialog if OTP verification fails
            showErrorDialog(context, next.error.toString());
          }
        });
        final asyncLogin = ref.watch(verificationCodeControllerProvider);
        final verificationController =
            ref.read(verificationCodeControllerProvider.notifier);

        if (asyncLogin is AsyncLoading) {
          return const FadeCircleLoadingIndicator();
        }

        return CustomButtonWidget(
          text: context.tr("sign_in"),
          onTap: () {
            if (_formKey.currentState!.validate()) {
              verificationController.verifyOtp(
                pinController.text,
                inputedPhone,
                context,
              );
              // verificationController.verifyOtp(
              //     pinController.text, inputedPhone, context);
              // _showDialog(context, verificationState);
              // showAdaptiveDialog(
              //     context: context,
              //     builder: (context) =>
              //         _buildVerificationState(verificationState));
            }
          },
          backgroundColor: AppColors.black,
          isFiled: true,
          height: 52,
          radius: 12,
          width: MediaQuery.sizeOf(context).width,
        ).onlyPadding(bottom: 20);
      },
    );
  }

  _buildAppBar(BuildContext context) => AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        leadingWidth: 65,
        title: Text(
          context.tr("activation_code"),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: CustomBackArrowWidget(),
      );

  _buildHeader(BuildContext context, String inputedPhone) {
    return Column(
      children: [
        Text(
          context.tr("activation_code_msg"),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: 15, color: AppColors.black900),
        ),
        8.verticalSpace,
        Directionality(
          textDirection: TextDirection.ltr,
          child: Text(
            inputedPhone,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  void _showDialog(context, verificationState) {
    showCustomDialog(
      context: context,
      title: _buildVerificationState(verificationState),
      // icon: Assets.icons.markIcon.svg(),
    );
  }

  _buildPrivacyAndPolicyCondition(BuildContext context) => Wrap(
        alignment: WrapAlignment.center,
        children: [
          Text(
            context.tr("privacy_policy_request"),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 12, color: AppColors.black900),
          ),
          Text(
            context.tr("privacy_policy"),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 13,
                  color: AppColors.black900,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      );
}
