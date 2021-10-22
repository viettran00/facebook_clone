import 'package:facebook_clone/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

class Rooms extends StatelessWidget {
  List<User> onlineUsers;

  Rooms({
    Key? key,
    required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      color: Colors.white,
      child: ListView.builder(
        itemCount: onlineUsers.length + 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return index == 0
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(20.0)),
                  width: 120.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.video_call, color: Colors.purple, size: 35.0),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "Create\nRoom",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      )
                    ],
                  ),
                )
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ProfileAvatar(
                      imageUrl: onlineUsers[index - 1].imageUrl,
                      isActive: true),
                );
        },
      ),
    );
  }
}
