import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:standard_project/src/features/app/app.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
        ),
        body: Column(
          children: [
            Text('Home Screen'),
          ],
        ));
  }
}
