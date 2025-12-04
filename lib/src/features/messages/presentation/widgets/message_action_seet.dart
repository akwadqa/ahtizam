import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../theme/app_colors.dart';

// Future<MessageActionSheet> showMessageActionSheet(
//     {required BuildContext context,
//     required VoidCallback onDelete,
//     required Function(String emoji) onReact}) async {
//   return MessageActionSheet(
//     onReact: onReact,
//     onDelete: onDelete,
//   );
// }

class MessageActionSheet extends StatelessWidget {
  final VoidCallback onDelete;
  final Function(String emoji) onReact;
  final List<String> currentReactions; 

   MessageActionSheet({
    super.key,
    required this.onDelete,
    required this.onReact,
    required this.currentReactions,

  });
    final availableEmojis = ['❤️', '😂', '👍', '😢','😡', '👏', '👎',];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title:
                Text('delete'.tr(),
                     style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 18, fontWeight: FontWeight.w500),),
            onTap: onDelete,
          ),
          ListTile(
            leading: Icon(Icons.emoji_emotions, color: AppColors.primary),
            title:
                Text('react'.tr(), 
                     style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 18, fontWeight: FontWeight.w500),)
                ,
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                context: context,
                builder: (_) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  availableEmojis.map((emoji) {
                      final isSelected = currentReactions.contains(emoji);
                      return GestureDetector(
                        onTap: () {
                          onReact(emoji);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected ? AppColors.primary.withOpacity(0.2) : null,
                            // border: isSelected
                            //     ? Border.all(color: AppColors.primary, width: 2)
                            //     : null,
                          ),
                          child: Text(
                            emoji,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
