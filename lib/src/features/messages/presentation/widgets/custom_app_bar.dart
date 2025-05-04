import 'package:ahtizam/src/shared_widgets/custom_back_arrow_widget.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart' ;

class CustomChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showSearch;
  final VoidCallback onSearchPressed;
  final VoidCallback onBackPressed;
  final VoidCallback onCloseSearch;
  final ValueChanged<String> onSearchTextChanged;

  const CustomChatAppBar({
    super.key,
    required this.showSearch,
    required this.onSearchPressed,
    required this.onCloseSearch,
    required this.onBackPressed,
    required this.onSearchTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: 
      showSearch?
      InkWell(
      onTap: onCloseSearch,
      child: Container(
          margin: EdgeInsetsDirectional.only(start: 10, bottom: 5, top: 5),
          padding: EdgeInsetsDirectional.only(start: 5),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Icon(
            Icons.close,
            color: Colors.white,
            size: 18,
          )),
    ):
       CustomBackArrowWidget()
      ,
      title: showSearch
          ? TextField(
              onChanged: onSearchTextChanged,
              decoration: const InputDecoration(
                hintText: 'ابحث...',
                border: InputBorder.none,
              ),
            )
          : const Text('محمد', style: TextStyle(color: Colors.black)),
      actions: [
      IconButton(
        icon: const Icon(Icons.search, color: Color(0xFFD9B23D)),
        onPressed: onSearchPressed,
      ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
