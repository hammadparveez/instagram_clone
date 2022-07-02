import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/src/utils/assets.dart';
import 'package:instagram_clone/src/utils/styles.dart';
import 'package:instagram_clone/src/view/home_screen/components/posts.dart';
import 'package:instagram_clone/src/view/home_screen/components/stories_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 8,
        elevation: 0.5,
        title: const Text('Instagram', style: kAppBarTitleStyle),
        actions: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset(Assets.paperPlaneIcon))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          _buildBottomNavBarItem(Assets.homeIcon),
          _buildBottomNavBarItem(Assets.paperPlaneIcon),
          _buildBottomNavBarItem(Assets.addPostIcon),
          _buildBottomNavBarItem(Assets.commentIcon),
          BottomNavigationBarItem(
            label: '',
            icon: IconButton(
              onPressed: () {},
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(9999),
                child: Image.network(
                  NetworkAssets.hulkAvatar,
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: const [
            StoriesWidget(),
            Divider(thickness: .5),
            PostsWidget(),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavBarItem(String assetsPath) =>
      BottomNavigationBarItem(
          icon: SvgPicture.asset(assetsPath, height: 20, width: 20), label: '');
}
