import 'dart:math';

import 'package:ahtizam/src/constants/Api/services_urls.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/location_searching_controller/show_map_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/quick_order_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/show_order_form_controller.dart';
import 'package:ahtizam/src/features/messages/presentation/controller/chat_controller.dart';
import 'package:ahtizam/src/features/messages/presentation/controller/send_message_controller.dart';
import 'package:ahtizam/src/features/messages/presentation/screens/chat_screens.dart';
import 'package:ahtizam/src/features/messages/presentation/screens/messages_screen.dart';
import 'package:ahtizam/src/routing/app_router.gr.dart';
import 'package:ahtizam/src/shared_widgets/app_error_widget.dart';
import 'package:ahtizam/src/shared_widgets/circle_image_widget.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../shared_widgets/custom_button_widget.dart';
import '../../../../../theme/app_colors.dart';

void showDriverDetailsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.transparent, // important
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.3,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return DriverDetailsBottomSheet();
        },
      );
    },
  );
}

class DriverDetailsBottomSheet extends ConsumerWidget {
  const DriverDetailsBottomSheet({super.key});
  // final TextEditingController messageField = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    final chatBadge = ref.watch(chatControllerProvider).showNewMessage;

    final asyncDriverInfo = ref.watch(quickOrderControllerProvider);
    final isThirdWidgetVisible = ref.watch(showOrderFormControllerProvider);
    final hideDriverBottomSheet = ref.watch(showMapControllerProvider);
    final sendMessage = ref.watch(sendMessageControllerProvider.notifier);
    final focus=FocusScope.of(context);
    return asyncDriverInfo.when(
      data: (data) {
        if (data?.orderDetails == null) return SizedBox();
        // if (data?.orderDetails != null) {
        final orderDetailsData = data?.orderDetails?.driverData;
        // }
        return hideDriverBottomSheet
            ? SizedBox.expand()
            : GestureDetector(
                onTap: () {
                 focus
                      .requestFocus(FocusNode()); // Dismiss keyboard
                },
                child: Container(
                  // margin: EdgeInsets.only(bottom: 100),
                  padding: EdgeInsets.only(
                      left: 22,
                      right: 22,
                      top: 25,
                      bottom: isThirdWidgetVisible ? 125 : 25),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.99),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                          onTap: () {
                            // Navigator.pop(context);
                            ref
                                .read(showMapControllerProvider.notifier)
                                .toggleSelection();
                          },
                          child: Icon(
                            Icons.keyboard_double_arrow_down_sharp,
                            color: Colors.grey,
                          ).centered()),
                      // **Truck & Driver Details Row**
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleImageWidget(
                            imageUrl: orderDetailsData?.image != null
                                ? ServicesUrls.imageUrl +
                                    orderDetailsData!.image!
                                : null,
                            // "https://i.pinimg.com/736x/c6/5e/55/c65e55dcc904491dc5549bad8ecca3bb.jpg",
                            height: 125,
                            width: 125,
                            circleWidth: 2,
                          ),
                          // ClipOval(
                          //   child: Container(
                          //       padding: EdgeInsets.all(4),
                          //       width: min(125, 125) / 2,
                          //       height: min(125, 125) / 2,
                          //       decoration: BoxDecoration(
                          //         color: AppColors.darkGray,
                          //         borderRadius: BorderRadius.circular(50),
                          //         border: Border.all(
                          //           color: Colors.black,
                          //           width: 3,
                          //         ),
                          //       ),
                          //       child:

                          //        Assets.icons.profile.svg()),
                          // ),
                          16.horizontalSpace,

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  orderDetailsData?.name ?? "driver",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                ),
                                5.verticalSpace,
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.amber, size: 18),
                                    4.horizontalSpace,
                                    Text(
                                      orderDetailsData?.rate.toString() ?? "0",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                // 5.verticalSpace,
                                // Text(
                                //   "otp_number".tr(args: ['2525']),
                                //   style: Theme.of(context)
                                //       .textTheme
                                //       .bodySmall!
                                //       .copyWith(fontSize: 14),
                                // ),
                              ],
                            ),
                          ),

                          // Profile Image

                          Column(
                            children: [
                              Assets.icons.truck.svg(),
                              5.verticalSpace,
                              Text(
                                orderDetailsData?.vehicleType ?? "KE232",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),

                      16.verticalSpace,

                      // **Message Input Field**
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: sendMessage.messageField,
                              onChanged: (value) {
                                ref
                                    .read(
                                        sendMessageControllerProvider.notifier)
                                    .setMessage(value);
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusColor: Colors.white,
                                suffixIcon: ref
                                            .watch(
                                                sendMessageControllerProvider)
                                            .value !=
                                        null
                                    ? ref
                                            .watch(
                                                sendMessageControllerProvider)
                                            .value!
                                            .isEmpty
                                        ? Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0, vertical: 8),
                                            child: Assets.icons.messages.svg(
                                                color: Colors.black,
                                                height: 10,
                                                width: 10))
                                        : IconButton(
                                            onPressed: () {
                                              ref
                                                  .read(chatControllerProvider
                                                      .notifier)
                                                  .sendMessageToSocket(
                                                      sendMessage
                                                          .messageField.text);

                                              sendMessage.messageField.clear();
                                              ref
                                                  .read(
                                                      sendMessageControllerProvider
                                                          .notifier)
                                                  .setMessage("");
                                              focus.unfocus();
                                            },
                                            icon: Icon(
                                              Icons.send,
                                              color: Colors.black,
                                              // size: 10,
                                            ))
                                    : SizedBox(),
                                hintText: "send_a_message".tr(),
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                        fontSize: 12, color: AppColors.grey600),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      keyboardVisible ? 150.verticalSpace : 20.verticalSpace,

                      // **Action Buttons (Cancel, Call, Pay)**
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            child: CustomButtonWidget(
                              onTap: () {

                                debugPrint(chatBadge.toString());
                                context.pushRoute(ChatRoute());
                                ref.read(chatControllerProvider.notifier).markMessagesAsSeen();

                              },
                              backgroundColor: AppColors.black,
                              isFiled: true,
                              height: 52,
                              radius: 12,
                              width: MediaQuery.sizeOf(context).width,
                              text: '',
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Assets.icons.messages
                                      .svg(color: AppColors.white),
                                  if (chatBadge)
                                    Positioned(
                                      top: -4,
                                      right: -4,
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                        
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          8.horizontalSpace,
                          Flexible(
                            flex: 2,
                            child: CustomButtonWidget(
                              text: context.tr(
                                "call_by",
                                // args: [orderDetailsData?.name ?? ""]
                              ),
                              onTap: () {
                                if (orderDetailsData?.phone != null) {
                                  final Uri telLaunchUri = Uri(
                                    scheme: 'tel',
                                    path: orderDetailsData?.phone,
                                  );
                                  launchUrl(telLaunchUri);
                                }
                              },
                              backgroundColor: AppColors.black,
                              isFiled: true,
                              height: 52,
                              radius: 12,
                              width: MediaQuery.sizeOf(context).width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Assets.icons.phoneIc.svg(),
                                  10.horizontalSpace,
                                  Text(
                                    context.tr("call_by", args: [""]),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                          fontSize: 15,
                                          color: (Colors.white),
                                          fontWeight: FontWeight.w500,
                                        ),
                                  )
                                ],
                              ).symmetricPadding(horizontal: 2),
                            ),
                          ),
                          8.horizontalSpace,
                          Flexible(
                            flex: 2,
                            child: CustomButtonWidget(
                              text: context.tr("cancel"),
                              onTap: () {
                                final koko = ref
                                    .watch(quickOrderControllerProvider)
                                    .value;
                                debugPrint(
                                    "✅ setNewOrderDetails => orderModel: ${koko?.orderModel?.quickOrderId}");

                                showAcceptCancelOrder(context, ref);
                              },
                              color: AppColors.black,
                              borderColor: AppColors.lightestGray,
                              backgroundColor: Colors.white,
                              isFiled: false,
                              height: 52,
                              radius: 12,
                              width: MediaQuery.sizeOf(context).width,
                            ),
                          ),
                        ],
                      ),

                      10.verticalSpace,
                    ],
                  ),
                ),
              );
      },
      loading: () => FadeCircleLoadingIndicator(),
      error: (error, stackTrace) => AppErrorWidget(),
    );
  }
}
