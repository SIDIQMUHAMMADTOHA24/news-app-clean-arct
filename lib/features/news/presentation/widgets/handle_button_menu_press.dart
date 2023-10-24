import 'package:flutter/material.dart';
import 'package:news_app/common/theme.dart';

class HandleMenuButtonPress extends StatelessWidget {
  const HandleMenuButtonPress({
    super.key,
    required this.iconName,
  });

  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: kGreyColor, borderRadius: BorderRadius.circular(20)),
      child: Image.asset(
        'assets/${iconName}_icon.png',
        width: 24,
      ),
    );
  }
}
