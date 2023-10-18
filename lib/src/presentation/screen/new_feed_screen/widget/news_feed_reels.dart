import 'package:flutter/material.dart';

class NewsFeedReelsArg {
  final int reelIndex;

  NewsFeedReelsArg({
    required this.reelIndex,
  });
}

class NewsFeedReels extends StatefulWidget {
  final NewsFeedReelsArg reelsArg;
  const NewsFeedReels({
    super.key,
    required this.reelsArg,
  });

  @override
  State<NewsFeedReels> createState() => _NewsFeedReelsState();
}

class _NewsFeedReelsState extends State<NewsFeedReels> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: widget.reelsArg.reelIndex == 0 ? 8 : 4,
        right: widget.reelsArg.reelIndex == 9 ? 8 : 4,
      ),
      height: 140,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Text('Reels ${widget.reelsArg.reelIndex}'),
    );
  }
}
