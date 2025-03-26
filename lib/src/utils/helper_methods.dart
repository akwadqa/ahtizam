import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

Future<void> safelyPop(BuildContext context) async {
  FocusScope.of(context).unfocus();
  await Future.delayed(const Duration(milliseconds: 100));
  if (context.mounted) context.maybePop();
}
