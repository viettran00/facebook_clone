import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/models/story_model.dart';
import 'package:facebook_clone/models/user_model.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  List<Story> stories;

  Stories({Key? key, required this.currentUser, required this.stories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double storiesRadius = 15.0;
    return Container(
      height: 200.0,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length + 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: Palette.storyGradient,
                    borderRadius: BorderRadius.circular(storiesRadius),
                  ),
                  height: double.infinity,
                  width: 100.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(storiesRadius),
                    child: Image.network(
                      index == 0
                          ? currentUser.imageUrl
                          : stories[index - 1].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 5.0,
                  left: 5.0,
                  child: index == 0
                      ? Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: IconButton(
                            onPressed: () {},
                            padding: const EdgeInsets.all(0.0),
                            icon: const Icon(Icons.add),
                            iconSize: 30.0,
                            color: Colors.blue,
                          ),
                        )
                      : CircleAvatar(
                          radius:  20.0,
                          backgroundColor: Palette.facebookBlue,
                          child: CircleAvatar(
                            radius: (stories[index - 1].isViewed ?? false) ? 17.0: 20.0,
                            backgroundImage:
                                NetworkImage(stories[index - 1].user.imageUrl),
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                ),
                Positioned(
                  bottom: 8.0,
                  left: 8.0,
                  right: 8.0,
                  child: Text(
                    index == 0 ? "Add to story" : stories[index - 1].user.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
