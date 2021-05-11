import 'package:flutter/material.dart';
import 'package:social_media_app/utils/app_color.dart';
import 'package:social_media_app/utils/icon_broken.dart';

Widget defaultAppBar({
  @required BuildContext context,
  String title,
  List<Widget> actions,
}) =>
    AppBar(
      backgroundColor: kLightpurple,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          IconBroken.Arrow___Left_2,
          color: klblack,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: klblack),
      ),
      actions: actions,
    );
