import 'dart:ui';

import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/localization/current_language.dart';
import 'package:ahtizam/src/routing/app_router.gr.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopNavigationBar extends ConsumerWidget {
  const TopNavigationBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final currentLanguage = ref.watch(currentLanguageProvider);
    final currentLanguageNotifier = ref.read(currentLanguageProvider.notifier);
    final String isArabicLanguage = currentLanguage == 'ar' ? 'en' : 'ar';
    final String myLanguage = currentLanguage == 'en' ?'عربي': 'en'  ;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // LanguageSwitcher(
                  //   initialLanguage: currentLanguage,
                  //   onLanguageChanged: (language) {
                  //     currentLanguageNotifier.changeLanguage(
                  //         context, isArabicLanguage);
                  //     print('Language changed to: $language');
                  //   },
                  // ),
                  GestureDetector(
                      onTap: () {
                  currentLanguageNotifier.changeLanguage(
                    context,isArabicLanguage
                  );
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (context) => ChatScreen()));
                      },
                      child:Text(myLanguage.toUpperCase(),

                         style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 15,
                    color:  AppColors.primary,

                    fontWeight: FontWeight.bold,
                  ),
                      )),
                  //  Assets.icons.settings.svg(height: 30, width: 30)),
                  Assets.icons.logo
                      .svg(fit: BoxFit.scaleDown)
                      .onlyPadding(top: 5),
                  GestureDetector(
                    onTap: () => context.pushRoute(NotificationsRoute()),
                    child: const Icon(Icons.notifications, size: 28),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LanguageSwitcher extends StatefulWidget {
  final Function(String) onLanguageChanged;
  final String initialLanguage;

  const LanguageSwitcher({
    super.key,
    required this.onLanguageChanged,
    this.initialLanguage = 'EN',
  });

  @override
  State<LanguageSwitcher> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  late String currentLanguage;

  @override
  void initState() {
    super.initState();
    currentLanguage = widget.initialLanguage;

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<double>(
      begin: currentLanguage == 'en' ? 0.0 : 1.0,
      end: currentLanguage == 'en' ? 0.0 : 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleLanguage() {
    setState(() {
      currentLanguage = currentLanguage == 'en' ? 'ar' : 'en';
    });

    _slideAnimation = Tween<double>(
      begin: _slideAnimation.value,
      end: currentLanguage == 'en' ? 0.0 : 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward(from: 0.0);
    widget.onLanguageChanged(currentLanguage);
  }

  Widget _buildSaudiFlag() {
    return ClipOval(
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color:const Color(0xFF006C35), 
          shape: BoxShape.circle,
        ),
        child:
        
        
         Text(
          "🇸🇦",
          style: TextStyle(fontSize: 20),
          
        ).centered(),
      ),
    );
  }

  Widget _buildBritishFlag() {
    return ClipOval(
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: const Color(0xFF012169),
          shape: BoxShape.circle,
        ),
        child:
        
        
         Text(
          "🇬🇧",
          style: TextStyle(fontSize: 20),
          
        ).centered(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleLanguage,
      child: SizedBox(
        width: 80,
        height: 40,
        child: Card.outlined(
          color: Colors.grey[300],
          elevation: 4,
          shape: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.white ),
            borderRadius: BorderRadius.circular(20),
          ),
          // decoration: BoxDecoration(
          //   color: Colors.grey[300],
          //   borderRadius: BorderRadius.circular(20),
          // ),
          child: Row(
            children: [
              // Circular flag icon
              SizedBox(
                width: 36,
                height: 36,
                // margin: const EdgeInsets.all(2),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   shape: BoxShape.circle,
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.black.withOpacity(0.15),
                //       blurRadius: 4,
                //       offset: const Offset(0, 2),
                //     ),
                //   ],
                // ),
                child: Center(
                  child: currentLanguage == 'en'
                      ? _buildSaudiFlag()
                      : _buildBritishFlag(),
                ),
              ),
              // Language text
              Expanded(
                child: Center(
                  child: Text(
                    currentLanguage == 'ar' ? 'EN' : 'عربي',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
