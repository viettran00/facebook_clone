import 'package:facebook_clone/models/user_model.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: NetworkImage(currentUser.imageUrl)),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                      decoration: InputDecoration(
                    hintText: "what\'s on you mind?",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                  )),
                ),
              ),
            ],
          ),
          const Divider(height: 8.0, thickness: 1.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: (){},
                icon: Icon(Icons.videocam, color: Colors.red,),
                label: Text("Live"),
              ),
              const SizedBox(height: 25.0,child: VerticalDivider(color: Colors.grey)),
              TextButton.icon(
                onPressed: (){},
                icon: Icon(Icons.photo_library, color: Colors.green,),
                label: Text("Photo"),
              ),
              const SizedBox(height: 25.0,child: VerticalDivider(color: Colors.grey)),
              TextButton.icon(
                onPressed: (){},
                icon: Icon(Icons.video_call, color: Colors.purple,),
                label: Text("Room"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
