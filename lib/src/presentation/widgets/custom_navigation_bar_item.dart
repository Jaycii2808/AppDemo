import 'package:flutter/material.dart';

class CustomBottomNavigationBarItem extends StatefulWidget {
  final int currentIdex;
  final int index;
  final String? label;
  final IconData? icon;
  final Function()? onTap;
  const CustomBottomNavigationBarItem({
    super.key,
    this.label,
    this.icon,
    required this.currentIdex,
    this.onTap,
    required this.index,
  });

  @override
  State<CustomBottomNavigationBarItem> createState() =>
      _CustomBottomNavigationBarItemState();
}

class _CustomBottomNavigationBarItemState
    extends State<CustomBottomNavigationBarItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        children: [
          Icon(
            widget.icon ?? Icons.adb,
            color:
                widget.currentIdex == widget.index ? Colors.red : Colors.black,
          ),
          Text(
            widget.label ?? 'Label',
            style: TextStyle(
                color: widget.currentIdex == widget.index
                    ? Colors.red
                    : Colors.black),
          ),
        ],
      ),
    );
  }
}
