// import 'package:ahtizam/src/shared_widgets/custom_back_arrow_widget.dart';
// import 'package:ahtizam/src/theme/app_colors.dart';
// import 'package:chatview/chatview.dart';
// import 'package:easy_localization/easy_localization.dart' as local;
// import 'package:flutter/material.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final _chatController = ChatController(
//     initialMessageList: Data.messageList,
//     scrollController: ScrollController(),
//     currentUser: ChatUser(
//       id: '1',
//       name: 'Flutter',
//     ),
//     otherUsers: [
//       ChatUser(
//         id: '2',
//         name: 'Simform',
//       ),
//       // ChatUser(
//       //   id: '3',
//       //   name: 'Jhon',
//       // ),
//       // ChatUser(
//       //   id: '4',
//       //   name: 'Mike',
//       // ),
//       // ChatUser(
//       //   id: '5',
//       //   name: 'Rich',
//       // ),
//     ],
//   );

//   void _showHideTypingIndicator() {
//     _chatController.setTypingIndicator = !_chatController.showTypingIndicator;
//   }

//   void receiveMessage() async {
//     _chatController.addMessage(
//       Message(
//         id: DateTime.now().toString(),
//         message: 'I will schedule the meeting.',
//         createdAt: DateTime.now(),
//         sentBy: '2',
//       ),
//     );
//     await Future.delayed(const Duration(milliseconds: 500));
//     _chatController.addReplySuggestions([
//       const SuggestionItemData(text: 'Thanks.'),
//       const SuggestionItemData(text: 'Thank you very much.'),
//       const SuggestionItemData(text: 'Great.')
//     ]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Directionality(
//         textDirection: context.locale.languageCode=="ar"? TextDirection.ltr:TextDirection.rtl,
//         child: ChatView(
//           chatController: _chatController,
//           onSendTap: _onSendTap,
//           featureActiveConfig: const FeatureActiveConfig(
//             lastSeenAgoBuilderVisibility: true,
//             receiptsBuilderVisibility: true,
//             enableScrollToBottomButton: true,
//           ),
//           scrollToBottomButtonConfig: ScrollToBottomButtonConfig(
//             backgroundColor: AppColors.offWhite,
//             border: Border.all(
//               color: Colors.grey,
//             ),
//             icon: Icon(
//               Icons.keyboard_arrow_down_rounded,
//               color: AppColors.black,
//               weight: 10,
//               size: 30,
//             ),
//           ),
//           chatViewState: ChatViewState.hasMessages,
//           chatViewStateConfig: ChatViewStateConfiguration(
//             loadingWidgetConfig: ChatViewStateWidgetConfiguration(
//               loadingIndicatorColor: AppColors.primary,
//             ),
//             onReloadButtonTap: () {},
//           ),
//           typeIndicatorConfig: TypeIndicatorConfiguration(
//             flashingCircleBrightColor: AppColors.white, indicatorSize: 6,
//             // flashingCircleDarkColor: AppColors.orange,
//           ),

//           appBar: AppBar(
//             automaticallyImplyLeading: false,
//             backgroundColor: AppColors.white,
//             elevation: 0,
//             centerTitle: true,
//             title: Text(
//               'محمد',
//               style: TextStyle(
//                 color: AppColors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             leading: IconButton(
//               icon: Icon(Icons.search, color: AppColors.primary),
//               onPressed: () {},
//             ),
//             actions: [
//               CustomBackArrowWidget(icon: Icons.arrow_forward_ios,),
//               IconButton(
//                 tooltip: 'Toggle TypingIndicator',
//                 onPressed: _showHideTypingIndicator,
//                 icon: Icon(
//                   Icons.keyboard,
//                   color: AppColors.black,
//                 ),
//               ),
//               IconButton(
//                 tooltip: 'Simulate Message receive',
//                 onPressed: receiveMessage,
//                 icon: Icon(
//                   Icons.supervised_user_circle,
//                   color: AppColors.black,
//                 ),
//               ),
//             ],
//           ),

//           chatBackgroundConfig: ChatBackgroundConfiguration(
//             messageTimeIconColor: AppColors.darkGray,
//             messageTimeTextStyle:
//                 Theme.of(context).textTheme.bodySmall!.copyWith(
//                       fontWeight: FontWeight.w300,
//                       color: AppColors.black,
//                     ),
//             defaultGroupSeparatorConfig: DefaultGroupSeparatorConfiguration(
//               textStyle: TextStyle(
//                 color: AppColors.grayishCharcoal,
//                 fontSize: 17,
//               ),
//             ),
//             backgroundColor: AppColors.fillGrey,
//           ),
//           sendMessageConfig: SendMessageConfiguration(

//             imagePickerIconsConfig: ImagePickerIconsConfiguration(
//               cameraIconColor: AppColors.black,
//               galleryIconColor: AppColors.black,
//             ),
//             defaultSendButtonColor: AppColors.primary,
//             replyMessageColor: AppColors.lightPrimary,
//             replyDialogColor: AppColors.border,
//             replyTitleColor: AppColors.black,
//             textFieldBackgroundColor: AppColors.white,
//             closeIconColor: AppColors.grayishCharcoal,
//             textFieldConfig: TextFieldConfiguration(
//               hintText: 'اكتب رسالتك...',
//               onMessageTyping: (status) {
//                 /// Do with status
//                 debugPrint(status.toString());
//               },
//               compositionThresholdTime: const Duration(seconds: 1),
//               textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     fontWeight: FontWeight.w500,
//                     color: AppColors.black900,
//                     fontSize: 15,
//                   ),
//             ),
//             micIconColor: AppColors.primary,
//             voiceRecordingConfiguration: VoiceRecordingConfiguration(
//               backgroundColor: AppColors.primary,
//               recorderIconColor: AppColors.black,
//               waveStyle: WaveStyle(
//                 showMiddleLine: false,
//                 waveColor: Colors.white,
//                 extendWaveform: true,
//                 showHourInDuration: true,
//                 showBottom: true,
//               ),
//             ),
//           ),
//           chatBubbleConfig: ChatBubbleConfiguration(
//             outgoingChatBubbleConfig: ChatBubble(
//               borderRadius: BorderRadius.only(
//                 bottomRight: Radius.zero,
//                 topLeft: Radius.circular(10),
//                 topRight: Radius.circular(10),
//                 bottomLeft: Radius.circular(10),
//               ),
//               color:
//                   AppColors.white, // White bubble background for YOUR messages
//               textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     fontWeight: FontWeight.w500,
//                     color: AppColors.black, // Dark text to contrast white
//                   ),

//               linkPreviewConfig: LinkPreviewConfiguration(
//                 backgroundColor: AppColors.white,
//               ),

//               receiptsWidgetConfig: const ReceiptsWidgetConfig(
//                   showReceiptsIn: ShowReceiptsIn.all),
//             ),
//             inComingChatBubbleConfig: ChatBubble(
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.zero,
//                   topLeft: Radius.circular(10),
//                   topRight: Radius.circular(10),
//                   bottomRight: Radius.circular(10),
//                 ),
//                 linkPreviewConfig: LinkPreviewConfiguration(
//                   linkStyle: TextStyle(
//                     color: Colors.blue,
//                     decoration: TextDecoration.underline,
//                   ),
//                   backgroundColor: AppColors.lightPrimary,

//                   // bodyStyle: AppColors.primary,
//                   // titleStyle: AppColors.primary,
//                 ),
//                 textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontWeight: FontWeight.w500,
//                       color: AppColors.white,
//                     ),
//                 onMessageRead: (message) {
//                   /// send your message reciepts to the other client
//                   debugPrint('Message Read');
//                 },
//                 // senderNameTextStyle: TextStyle(color: AppColors.dimGray),
//                 color: AppColors.primary,
//                 senderNameTextStyle: TextStyle(color: AppColors.fillGrey)),
//           ),
//           replyPopupConfig: ReplyPopupConfiguration(
//             backgroundColor: AppColors.primary,
//             buttonTextStyle: TextStyle(color: AppColors.black),
//             topBorderColor: AppColors.white,
//           ),
//           reactionPopupConfig: ReactionPopupConfiguration(
//             shadow: BoxShadow(
//               color: Colors.grey.shade400,
//               blurRadius: 20,
//             ),
//             backgroundColor: AppColors.white,
//           ),
//           messageConfig: MessageConfiguration(
//             messageReactionConfig: MessageReactionConfiguration(
//               backgroundColor: AppColors.white,
//               borderColor: AppColors.grayBorder,
//               reactedUserCountTextStyle: TextStyle(color: AppColors.black),
//               reactionCountTextStyle: TextStyle(color: AppColors.primary),
//               reactionsBottomSheetConfig: ReactionsBottomSheetConfiguration(
//                 backgroundColor: AppColors.black,
//                 reactedUserTextStyle: TextStyle(
//                   color: AppColors.primary,
//                 ),
//                 reactionWidgetDecoration: BoxDecoration(
//                   color: AppColors.white,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//             imageMessageConfig: ImageMessageConfiguration(
//               margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
//               shareIconConfig: ShareIconConfiguration(
//                 defaultIconBackgroundColor: AppColors.fillGrey,
//                 defaultIconColor: AppColors.fillGrey,
//               ),
//             ),
//           ),
//           repliedMessageConfig: RepliedMessageConfiguration(
//             backgroundColor: AppColors.replayGrey,
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//             padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
//             verticalBarColor: AppColors.primary,
//             verticalBarWidth: 3,
//             repliedMsgAutoScrollConfig: RepliedMsgAutoScrollConfig(
//               enableHighlightRepliedMsg: true,
//               highlightColor: AppColors.black,
//               highlightScale: 1.1,
//             ),
//             textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.black,
//                 ),
//             replyTitleTextStyle: TextStyle(color: AppColors.primary),
//           ),
//           swipeToReplyConfig: SwipeToReplyConfiguration(
//             replyIconColor: AppColors.primary,
//           ),
//           replySuggestionsConfig: ReplySuggestionsConfig(
//             itemConfig: SuggestionItemConfig(
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(
//                   color: AppColors.border,
//                 ),
//               ),
//               textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     fontWeight: FontWeight.w500,
//                     color: AppColors.black,
//                   ),
//             ),
//             onTap: (item) =>
//                 _onSendTap(item.text, const ReplyMessage(), MessageType.text),
//           ),
//         ),
//       ),
//     );
//   }

//   String _formatTime(DateTime time) {
//     return local.DateFormat('h:mm a').format(time); // e.g. 10:00 p.m
//   }

//   void _onSendTap(
//     String message,
//     ReplyMessage replyMessage,
//     MessageType messageType,
//   ) {
//     _chatController.addMessage(
//       Message(
//         id: DateTime.now().toString(),
//         createdAt: DateTime.now(),
//         message: message,
//         sentBy: _chatController.currentUser.id,
//         replyMessage: replyMessage,
//         messageType: messageType,
//       ),
//     );
//     Future.delayed(const Duration(milliseconds: 300), () {
//       _chatController.initialMessageList.last.setStatus =
//           MessageStatus.undelivered;
//     });
//     Future.delayed(const Duration(seconds: 1), () {
//       _chatController.initialMessageList.last.setStatus = MessageStatus.read;
//     });
//   }

//   Widget _customIncomingBubble(
//     Message message,
//   ) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       margin: const EdgeInsets.symmetric(vertical: 2),
//       decoration: BoxDecoration(
//         color: AppColors.primary,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             message.message,
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
//           ),
//           SizedBox(height: 5),
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: Text(
//               _formatTime(message.createdAt),
//               style: TextStyle(color: Colors.white70, fontSize: 10),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _customOutgoingBubble(Message message) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       margin: const EdgeInsets.symmetric(vertical: 2),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Text(
//             message.message,
//             style:
//                 TextStyle(color: AppColors.black, fontWeight: FontWeight.w500),
//           ),
//           SizedBox(height: 5),
//           Align(
//             alignment: Alignment.bottomRight,
//             child: Text(
//               _formatTime(message.createdAt),
//               style: TextStyle(color: Colors.grey, fontSize: 10),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Data {
//   static final messageList = [
//     Message(
//       id: '1',
//       message: "Hi!",
//       createdAt: DateTime.now(),
//       sentBy: '1',
//       status: MessageStatus.read,
//     ),
//     Message(
//       id: '2',
//       message: "Hi!",
//       createdAt: DateTime.now(),
//       sentBy: '2',
//       status: MessageStatus.read,
//     ),
//     Message(
//       id: '3',
//       message: "We can meet? I am free",
//       createdAt: DateTime.now(),
//       sentBy: '1',
//       status: MessageStatus.read,
//     ),
//     Message(
//       id: '4',
//       message: "Can you write the time and place of the meeting?",
//       createdAt: DateTime.now(),
//       sentBy: '1',
//       status: MessageStatus.read,
//     ),
//     Message(
//       id: '5',
//       message: "That's fine",
//       createdAt: DateTime.now(),
//       sentBy: '2',
//       reaction: Reaction(reactions: ['\u{2764}'], reactedUserIds: ['1']),
//       status: MessageStatus.read,
//     ),
//     Message(
//       id: '6',
//       message: "When to go?",
//       createdAt: DateTime.now(),
//       sentBy: '2',
//       status: MessageStatus.read,
//     ),
//     Message(
//       id: '7',
//       message: "https://bit.ly/3JHS2Wl",
//       createdAt: DateTime.now(),
//       sentBy: '2',
//       reaction: Reaction(reactions: ['\u{2764}'], reactedUserIds: ['1']),
//       status: MessageStatus.read,
//       replyMessage: const ReplyMessage(
//         message: "Can you write the time and place of the meeting?",
//         replyTo: '1',
//         replyBy: '2',
//         messageId: '4',
//       ),
//     ),
//     Message(
//       id: '8',
//       message: "Done",
//       createdAt: DateTime.now(),
//       sentBy: '1',
//       status: MessageStatus.read,
//       reaction: Reaction(
//         reactions: ['\u{2764}'],
//         reactedUserIds: ['2'],
//       ),
//     ),
//     Message(
//       id: '9',
//       message: "Thank you!!",
//       createdAt: DateTime.now(),
//       sentBy: '1',
//       status: MessageStatus.read,
//       reaction: Reaction(
//         reactions: ['\u{2764}'],
//         reactedUserIds: ['2'],
//       ),
//     ),
//     Message(
//       id: '10',
//       message: "https://miro.medium.com/max/1000/0*s7of7kWnf9fDg4XM.jpeg",
//       createdAt: DateTime.now(),
//       messageType: MessageType.image,
//       sentBy: '1',
//       reaction: Reaction(reactions: ['\u{2764}'], reactedUserIds: ['2']),
//       status: MessageStatus.read,
//     ),
//     Message(
//       id: '11',
//       message: "🤩🤩",
//       createdAt: DateTime.now(),
//       sentBy: '2',
//       status: MessageStatus.read,
//     ),
//   ];
// }

//////////////////////////////////////////////////////
///
import 'package:ahtizam/src/features/messages/presentation/widgets/message_action_seet.dart';
import 'package:ahtizam/src/utils/helper_methods.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart' as locale;
import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ahtizam/src/features/messages/presentation/controller/chat_controller.dart';
import 'package:ahtizam/src/features/messages/presentation/widgets/custom_app_bar.dart';
import 'package:ahtizam/src/features/messages/presentation/widgets/custom_input_bar.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
// import 'package:intl/intl.dart'  as local;

@RoutePage()
class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});
  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _chatController = InMemoryChatController();

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatControllerProvider);
    final controller = ref.read(chatControllerProvider.notifier);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.stoneGray,
        appBar: CustomChatAppBar(
          showSearch: state.showSearch,
          onCloseSearch: controller.toggleSearch,
          onSearchPressed: controller.toggleSearch,
          onBackPressed: controller.handleBack,
          onSearchTextChanged: controller.searchMessages,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: AppColors.lightGray, // Or any color you like

                child: Chat(
                  textMessageOptions: TextMessageOptions(),
                  textMessageBuilder: (message,
                          {required int messageWidth,
                          required bool showName}) =>
                      _customTextMessageBuilder(
                    message,
                    messageWidth: messageWidth,
                    showName: showName,
                    currentUser: state.currentUser,
                  ),

                  theme: DefaultChatTheme(
                    inputBackgroundColor: Colors.white,
                    backgroundColor: AppColors.lightGray,
                    primaryColor: AppColors.white,
                    sentMessageBodyTextStyle: TextStyle(color: AppColors.black),
                    receivedMessageBodyTextStyle:
                        TextStyle(color: Colors.white),
                  ),
                  messages: state.filteredMessages,
                  user: state.currentUser,
                  onSendPressed: controller.handleSend,
                  slidableMessageBuilder: (message, child) {
                    return Dismissible(
                      key: ValueKey(message.id),
                      direction: DismissDirection.startToEnd,
                      confirmDismiss: (_) async {
                        controller.setReplyingTo(message);
                        return false; // prevent dismiss
                      },
                      background: Container(
                        alignment: Alignment.centerRight,
                        color: AppColors.primary.withOpacity(0.2),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.reply, color: Colors.white),
                      ),
                      child: child,
                    );
                  },
                  onMessageLongPress: (context, message) async {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => MessageActionSheet(
                        onDelete: () {
                          Navigator.pop(context);
                          controller.deleteMessage(message);
                        },
                        onReact: (emoji) {

                          controller.reactToMessage(message, emoji);
                          Navigator.pop(context);

                        },
                        currentReactions:  List<String>.from(message.metadata?['reactions'] ?? []),
                      ),
                    );
                  },

                  // onAttachmentPressed: controller.pickImage,
                  customBottomWidget: CustomInputBar(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customTextMessageBuilder(
    types.TextMessage message, {
    required int messageWidth,
    required bool showName,
    required types.User currentUser,
  }) {
    final isCurrentUser = message.author.id == currentUser.id;
    final bool isArabic = isRTL(message.text);
// print(message.previewData?.title);
    return Stack(
      children: [
        Container(
          color: AppColors.lightGray,
          padding: EdgeInsets.only(bottom: 20),
          child: Container(
            width: messageWidth.toDouble(),
            // margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              color: isCurrentUser ? Colors.white : AppColors.primary,
              // border: Border.all(color:isCurrentUser ? Colors.white : AppColors.primary, ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: isCurrentUser ? Radius.circular(10) : Radius.zero,
                bottomRight: isCurrentUser ? Radius.zero : Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment:
                  isArabic ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                // Reply part if any
                if (message.repliedMessage != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 24),
                    decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(10),
                      border: Border(
                        right: BorderSide(width: 4, color: AppColors.primary),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child:
                          
                          message.repliedMessage is types.TextMessage
                                ?  Text(
                            (message.repliedMessage as types.TextMessage)
                                    .text,
                                // : 'صورة أو ملف',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ):SizedBox(
                            height: 20,
                            width: 50,
                          ),
                        ),
                      ],
                    ),
                  ),

                // Main message text
                Text(
                  message.text,
                  textDirection:
                      isArabic ? TextDirection.rtl : TextDirection.ltr,
                  style: TextStyle(
                      color: isCurrentUser ? AppColors.black : Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                const SizedBox(height: 4),

                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    _formatTime(message.createdAt!),
                    style: TextStyle(
                      color: isCurrentUser ? Colors.grey : Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        PositionedDirectional(
            bottom: 0,
            start: 5,
            child: (message.metadata?['reactions'] != null)
                ?
                message.metadata!['reactions'].toString().isNotEmpty
                    ?  Wrap(
                            children: List<Widget>.from(
                              (message.metadata!['reactions'] as List)
                                  .map((e) => ClipOval(
                        child: Container(
                          color: AppColors.white,
                          padding: EdgeInsets.all(8),
                          child:Text(e,
                                            style: TextStyle(fontSize: 14)),
                                      )),
                            ),
                          ),
                        )
                      
                    : SizedBox()
                : SizedBox()),
      ],
    );
  }

  String _formatTime(int timestamp) {
    final time = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return locale.DateFormat('h:mm a').format(time);
  }
}
