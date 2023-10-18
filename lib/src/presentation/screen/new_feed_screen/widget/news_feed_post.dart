import 'package:flutter/material.dart';

class NewsFeedPostArg {
  final int postIndex;

  NewsFeedPostArg({
    required this.postIndex,
  });
}

class NewsFeedPost extends StatefulWidget {
  final NewsFeedPostArg postArg;
  const NewsFeedPost({
    super.key,
    required this.postArg,
  });

  @override
  State<NewsFeedPost> createState() => _NewsFeedPostState();
}

class _NewsFeedPostState extends State<NewsFeedPost> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 16),
      margin: EdgeInsets.only(
        left: 8,
        right: 8,
        top: widget.postArg.postIndex == 0 ? 8 : 4,
        bottom: widget.postArg.postIndex == 0 ? 8 : 4,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                  right: 8,
                ),
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  color: Colors.white38,
                  shape: BoxShape.circle,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Title',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            right: 8,
                          ),
                          child: const Icon(
                            Icons.more_horiz,
                            size: 15,
                            color: Colors.white38,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.clear,
                            size: 20,
                            color: Colors.white38,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'DateTime',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white38,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(
                            left: 2,
                            right: 2,
                          ),
                          child: const Icon(
                            Icons.circle,
                            size: 2,
                            color: Colors.white38,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.public,
                            size: 10,
                            color: Colors.white38,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            color: Colors.white24,
            height: 1,
            thickness: 1,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isLike = !isLike;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      isLike ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                      color: isLike ? Colors.blue : Colors.white,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'Thích',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: const [
                  Icon(
                    Icons.mode_comment_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Bình luận',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.share_rounded,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Chia sẻ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
