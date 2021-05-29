import 'package:flutter/material.dart';
import '../index.dart';

class FeedBackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    return Scaffold(
      appBar:
          backAppBar(context: context, color: colors.k_bkColor, isside: true),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
