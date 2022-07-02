import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/src/mock/mock_posts.dart';
import 'package:instagram_clone/src/model/post_model.dart';
import 'package:instagram_clone/src/utils/assets.dart';
import 'package:instagram_clone/src/utils/styles.dart';

class PostsWidget extends StatelessWidget {
  const PostsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: mockPosts.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          var post = mockPosts[index];
          return Container(
            height: 500,
            padding: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PostTitle(post: post),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: _buildPostImage(post),
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _buildPostCommentIcon(Assets.heartIcon),
                          _buildPostCommentIcon(Assets.commentIcon),
                          _buildPostCommentIcon(Assets.paperPlaneIcon),
                          const Spacer(),
                          _buildPostCommentIcon(Assets.bookmarkIcon),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child:
                            Text('${post.views} views', style: kPostTitleStyle),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Text('@Flutter Dev ', style: kPostTitleStyle),
                            Expanded(
                              child: Text(post.description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: kPostCommentStyle),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('View all ${post.totalComments} comments',
                          style: kPostSubtitleStyle),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: kPostTitleStyle.copyWith(
                                  fontWeight: FontWeight.normal),
                              decoration: const InputDecoration(
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.only(top: 4),
                                  border: InputBorder.none,
                                  hintText: 'Add a comment...',
                                  hintStyle: kPostSubtitleStyle,
                                  prefixIconConstraints: BoxConstraints(
                                      maxHeight: 35, maxWidth: 35),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          NetworkAssets.flutterBirdAvatar),
                                    ),
                                  ),
                                  suffix: Icon(
                                    Icons.heart_broken,
                                    color: Colors.red,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text('3 days ago', style: kPostSubtitleStyle),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _buildPostImage(PostModel post) {
    if (post.images.isNotEmpty) {
      return PageView.builder(
          itemCount: post.images.length,
          itemBuilder: (_, index) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.network(post.images[index],
                    width: double.infinity, fit: BoxFit.cover),
                Positioned(
                    top: 5,
                    right: 10,
                    child: Center(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black87),
                        child: Text('${index + 1}/${post.images.length}',
                            style: TextStyle(color: Colors.white)),
                      ),
                    )),
              ],
            );
          });
    }
    return Image.network(NetworkAssets.batManAvatar,
        width: double.infinity, fit: BoxFit.cover);
  }

  Widget _buildPostCommentIcon(String iconPath) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
        child: SvgPicture.asset(iconPath, height: 24, width: 20),
      ),
    );
  }
}

class _PostTitle extends StatelessWidget {
  const _PostTitle({
    Key? key,
    required this.post,
  }) : super(key: key);
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(NetworkAssets.flutterBirdAvatar),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.fullName,
                style: kPostTitleStyle,
              ),
              Text('Karachi, Pakistan', style: kPostSubtitleStyle),
            ],
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, size: 20)),
        ],
      ),
    );
  }
}
