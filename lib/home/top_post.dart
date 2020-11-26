import 'package:flutter/material.dart';
import 'package:test_app/models/top_post_model.dart';

final TOP_POSTS = [
  TopPostData(
    personName: 'Arlene',
    personIcon: 'https://s3.amazonaws.com/37assets/svn/765-default-avatar.png',
    postDescription:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
  ),
  TopPostData(
    personName: 'Lucy',
    personIcon: 'https://s3.amazonaws.com/37assets/svn/765-default-avatar.png',
    postDescription:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
  ),
];

class TopPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Text(
              'Top Posts',
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              final topPost = TOP_POSTS[index];
              return TopPostItem(
                topPostData: topPost,
              );
            },
            itemCount: TOP_POSTS.length,
          ),
        ],
      ),
    );
  }
}

class TopPostItem extends StatelessWidget {
  final TopPostData topPostData;
  TopPostItem({this.topPostData});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              topPostData.personIcon,
            ),
            backgroundColor: Colors.transparent,
            radius: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    topPostData.personName,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(topPostData.postDescription),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
