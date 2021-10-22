import 'package:facebook_clone/models/user_model.dart';
import 'package:flutter/material.dart';

class Story {
  final User user;
  final String imageUrl;
  final bool? isViewed;

  Story({
    required this.user,
    required this.imageUrl,
    @required this.isViewed,
  });
}
