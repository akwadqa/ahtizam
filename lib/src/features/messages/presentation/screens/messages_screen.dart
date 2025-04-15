import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/features/messages/presentation/screens/chat_screens.dart';
import 'package:ahtizam/src/shared_widgets/circle_image_widget.dart';
import 'package:ahtizam/src/shared_widgets/custom_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../theme/app_colors.dart';

class MessagesScreen extends StatelessWidget {
  MessagesScreen({super.key});
  final SearchController controller = SearchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: CustomAppbar(
          title: "الرسائل",
          withBackButton: false,
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildSearchBar(context),
          10.verticalSpace,
          _buildMessagesList(),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextFormField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        style: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(fontSize: 14, color: AppColors.black800),

        decoration: InputDecoration(
          fillColor: AppColors.lightGray,
          filled: true,
          suffixIcon: Icon(
            Icons.search,
            color: AppColors.gray,
            size: 20,
          ),
          hintText: context.tr('search'),
          hintStyle: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(fontSize: 14, color: AppColors.gray),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(12),
          ),
          border: InputBorder.none,
        ),
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
        // onSaved: onSaved,
      ),
    );
  }

  Widget _buildMessagesList() {
    final messages = _dummyMessages;

    return Expanded(
      child: ListView.separated(
        itemCount: messages.length,
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          color: AppColors.lightGray,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => ChatScreen()));
          },
          child: ChatItemCard(
            userName: messages[index].userName,
            message: messages[index].message,
            time: messages[index].time,
            dateLabel: messages[index].dateLabel,
            userImageUrl: messages[index].userImageUrl,
          ),
        ),
      ),
    );
  }
}

// Message Model
class Message {
  final String userName;
  final String message;
  final String time;
  final String dateLabel;
  final String userImageUrl;
  final bool isOnline;

  Message({
    required this.userName,
    required this.message,
    required this.time,
    required this.dateLabel,
    required this.userImageUrl,
    this.isOnline = true,
  });
}

// Dummy Data
final List<Message> _dummyMessages = List.generate(
  8,
  (index) => Message(
    userName: "سالم محمد",
    message: "انا الان في الطريق",
    time: "2:00 PM",
    dateLabel: "Today",
    userImageUrl: "https://i.pravatar.cc/150?img=3",
  ),
);

class ChatItemCard extends StatelessWidget {
  final String userName;
  final String message;
  final String time;
  final String dateLabel;
  final String userImageUrl;
  final bool isOnline;

  const ChatItemCard({
    super.key,
    required this.userName,
    required this.message,
    required this.time,
    required this.dateLabel,
    required this.userImageUrl,
    this.isOnline = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildUserAvatar(context, userImageUrl, isOnline),
              12.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 14,
                        color: AppColors.dark,
                        fontWeight: FontWeight.w500),
                  ),
                  8.verticalSpace,
                  Text(
                    message,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 12, color: AppColors.gray),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    dateLabel,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 12, color: AppColors.gray),
                  ),
                  8.verticalSpace,
                  Text(
                    time,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 14,
                        color: AppColors.dark,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              12.horizontalSpace,
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserAvatar(
      BuildContext context, String imageUrl, bool isOnline) {
    return Stack(
      children: [
        SizedBox(
            width: 50,
            height: 50,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.all(Radius.circular(50)),
            // ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.fill,
                errorWidget: (_, __, ___) {
                  return Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 50,
                  );
                },
              ),
            )),
        if (isOnline)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}
