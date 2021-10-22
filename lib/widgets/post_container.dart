import 'package:facebook_clone/models/post_model.dart';
import 'package:facebook_clone/utils/constants.dart';
import 'package:facebook_clone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PostHeader(post: post),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 5.0),
            child: Text(post.caption,
                style: TextStyle(color: Colors.black, fontSize: 16.0)),
          ),
          post.imageUrl != null
              ? Image.network(
                  post.imageUrl!,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                )
              : SizedBox.shrink(),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 12.0,
                  child: Icon(
                    Icons.thumb_up,
                    color: Colors.white,
                    size: 16.0,
                  ),
                ),
                const SizedBox(width: 5.0),
                Text(post.likes.toString()),
                Spacer(),
                Text(
                    "${post.comments.toString()} Comments • ${post.shares.toString()} Shares"),
              ],
            ),
          ),
          Divider(
            thickness: 1.0,
            height: 8.0,
            endIndent: 15,
            indent: 15.0,
          ),
          Row(
            children: [
              Expanded(
                child: _PostButton(
                  icon: MdiIcons.thumbUpOutline,
                  title: "Like",
                  onTap: (){print("Like");},
                ),
              ),
              Expanded(
                child: _PostButton(
                  icon: MdiIcons.commentOutline,
                  title: "Comment",
                  onTap: (){print("Comment");},
                ),
              ),
              Expanded(
                child: _PostButton(
                  icon: MdiIcons.shareOutline,
                  title: "Share",
                  onTap: (){print("Share");},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _PostButton extends StatelessWidget {
  Function()? onTap;
  final String title;
  final IconData icon;

  _PostButton({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 5.0),
            Text(title)
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Row(
        children: [
          ProfileAvatar(imageUrl: post.user.imageUrl),
          const SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.user.name, style: kUsername),
              Row(
                children: [
                  Text("${post.timeAgo} • ", style: kTimePostAgo),
                  Icon(
                    Icons.public,
                    size: 18.0,
                    color: Colors.grey[600],
                  )
                ],
              )
            ],
          ),
          Spacer(),
          IconButton(
              icon: Icon(
                Icons.more_horiz,
              ),
              onPressed: () {
                print("More");
              }),
        ],
      ),
    );
  }
}
