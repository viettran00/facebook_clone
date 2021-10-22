import 'package:facebook_clone/config/palette.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;

  const CustomTabBar({
    Key? key,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
    required this.isBottomIndicator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: icons
          .asMap()
          .map((index, iconData) => MapEntry(
              index,
              Tab(
                icon: Icon(
                  iconData,
                  color: index == selectedIndex
                      ? Palette.facebookBlue
                      : Colors.black45,
                ),
              )))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
