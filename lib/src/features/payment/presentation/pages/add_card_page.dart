import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/shared_widgets/custom_appbar.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared_widgets/custom_button_widget.dart';
import '../../../../utils/helper_methods.dart';
import '../controller/add_card_controller.dart';
import '../widgets/card_input_form.dart';

@RoutePage()
class AddCardPage extends ConsumerWidget {
  const AddCardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addCardState = ref.watch(addCardControllerProvider);
    final addCardController = ref.read(addCardControllerProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      // extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: CustomAppbar(title: "add_card"),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              physics: const NeverScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      16.verticalSpace,
                      CardInputForm(
                        formKey: addCardController.formKey,
                        cardHolderController:
                            addCardController.cardHolderController,
                        cardNumberController:
                            addCardController.cardNumberController,
                        expiryDateController:
                            addCardController.expiryDateController,
                        cvcController: addCardController.cvcController,
                      ),
                      const Spacer(),
                      addCardState.isLoading
                          ? const FadeCircleLoadingIndicator()
                          : CustomButtonWidget(
                              text: context.tr("add"),
                              onTap: addCardState.isLoading
                                  ? null
                                  : () async {
                                      final success =
                                          await addCardController.saveCard();
                                      if (success && context.mounted) {
                                        addCardController.resetForm();
                                        await safelyPop(context);
                                      }
                                    },
                              backgroundColor: AppColors.black,
                              isFiled: true,
                              height: 52,
                              radius: 12,
                              width: MediaQuery.sizeOf(context).width,
                            ).onlyPadding(bottom: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
