import 'package:app_demo/src/presentation/screen/new_feed_screen/widget/news_feed_content_bar.dart';
import 'package:app_demo/src/presentation/screen/new_feed_screen/widget/news_feed_post.dart';
import 'package:app_demo/src/presentation/screen/new_feed_screen/widget/news_feed_reels.dart';
import 'package:flutter/material.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.7),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            const NewsFeedContentBar(),
            const Divider(
              color: Colors.black,
              height: 1,
              thickness: 2,
            ),
            Column(
              children: [
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsFeedReels(
                        reelsArg: NewsFeedReelsArg(
                          reelIndex: index,
                        ),
                      );
                    },
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  height: 1,
                  thickness: 2,
                ),
                ListView.separated(
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return NewsFeedPost(
                      postArg: NewsFeedPostArg(
                        postIndex: index,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      color: Colors.black,
                      height: 1,
                      thickness: 2,
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
