import 'package:app_demo/src/presentation/widgets/custom_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  final List<NavigationBarItem> items;
  final int? currentIndex;
  final Function(int index)? onTap;
  const CustomNavigationBar({
    super.key,
    required this.items,
    this.currentIndex,
    this.onTap,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...widget.items.map(
              (e) => CustomBottomNavigationBarItem(
                label: e.label,
                icon: e.icon,
                currentIdex: widget.currentIndex ?? 1,
                index: e.index,
                onTap: widget.onTap?.call(e.index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationBarItem {
  final int index;
  final IconData icon;
  final String label;

  NavigationBarItem(this.index, this.icon, this.label);
}
