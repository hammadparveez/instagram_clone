import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clone/src/utils/assets.dart';

class StoriesWidget extends StatelessWidget {
  const StoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final child = Container(
              height: 80,
              width: 80,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black26)),
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        fit: BoxFit.cover,
                        image: NetworkImage(NetworkAssets.ironManAvatar))),
              ),
            );

            if (index == 0) {
              return Row(
                children: [
                  Container(
                    height: 76,
                    width: 76,
                    margin: const EdgeInsets.all(4),
                    alignment: Alignment.bottomRight,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                NetworkImage(NetworkAssets.flutterBirdAvatar))),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                      child:
                          const Icon(Icons.add, size: 15, color: Colors.white),
                    ),
                  ),
                  child,
                ],
              );
            }
            return child;
          },
          separatorBuilder: (_, index) => const SizedBox(width: 10),
          itemCount: 10),
    );
  }
}
