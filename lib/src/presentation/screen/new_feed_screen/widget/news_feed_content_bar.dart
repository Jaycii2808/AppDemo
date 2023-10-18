import 'package:flutter/material.dart';

class NewsFeedContentBar extends StatefulWidget {
  const NewsFeedContentBar({super.key});

  @override
  State<NewsFeedContentBar> createState() => _NewsFeedContentBarState();
}

class _NewsFeedContentBarState extends State<NewsFeedContentBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 8,
            top: 8,
            bottom: 8,
            right: 8,
          ),
          height: 30,
          width: 30,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 8, bottom: 8, right: 16),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white38,
                )),
            child: const Text(
              'Content?',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 8,
            bottom: 8,
            right: 16,
          ),
          child: const Icon(
            Icons.perm_media_outlined,
            size: 15,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
