import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/features/messages/presentation/controller/chat_controller.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class CustomInputBar extends ConsumerWidget {
  // final void Function(types.PartialText) onSend;
  // final void Function(ImageSource) onImagePick;
  // final types.Message? replyingTo;
  // final VoidCallback? onCancelReply;
   CustomInputBar({
    super.key,
    // required this.onSend,
    // required this.onImagePick,
    // this.onCancelReply,
    // this.replyingTo,
  });

  
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(chatControllerProvider);
    final controller = ref.read(chatControllerProvider.notifier);
  final _controller = TextEditingController();

void _sendMessage(ChatController controller) {

    final text = _controller.text.trim();
    if (text.isEmpty) return;
    controller.handleSend(types.PartialText(text: text));
    _controller.clear();

    // if (mounted) {
    // setState(() {}); // Hide reply widget
    // }
  }


    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      color: Colors.white,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              showModalBottomSheet(
                context: context,
                builder: (_) => Wrap(
                  children: [
                    ListTile(
                      leading: Icon(Icons.camera_alt),
                      title: Text('Camera'),
                      onTap: () {
                        Navigator.pop(context);
                        controller.pickImage(ImageSource.camera);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.photo),
                      title: Text('Gallery'),
                      onTap: () {
                        Navigator.pop(context);
                        controller.pickImage(ImageSource.gallery);
                      },
                    ),
                  ],
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add, color: Colors.grey),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.lighterGray,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  if (state.replyingTo != null)
                    Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
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
                            child: Text(
                              state.replyingTo is types.TextMessage
                                  ? (state.replyingTo as types.TextMessage).text
                                  : 'صورة أو ملف',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              print("canceled");
                              controller.resetReplyingTo();
                                  // setState(() {});                 // ✅ rebuild UI to hide widget

                            },
                          ),
                        ],
                      ),
                    ),
                  TextFormField(
                    controller: _controller,
                    textAlign: TextAlign.right,
                    decoration:  InputDecoration(
                      hintText: 'اكتب رسالة...',
 hintStyle: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(fontSize: 14, color: AppColors.grey600),                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _sendMessage(controller),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Assets.icons.sendIc.svg(height: 25, width: 25),
            ),
          ),
        ],
      ),
    );
  
}}
