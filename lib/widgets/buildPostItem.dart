import 'package:flutter/material.dart';
import 'package:social_media_app/bloc/cubit.dart';
import 'package:social_media_app/model/post_model.dart';
import 'package:social_media_app/utils/app_color.dart';
import 'package:social_media_app/utils/icon_broken.dart';

class BuildPostItem extends StatelessWidget {
  PostModel model;
  BuildPostItem(this.model);
  int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage('${model.image}'),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${model.name}",
                            style: TextStyle(
                              height: 1.4,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.check_circle,
                            color: kdefulatColor,
                            size: 16,
                          ),
                        ],
                      ),
                      Text(
                        "${model.dateTime}",
                        style: Theme.of(context).textTheme.caption.copyWith(
                              height: 1.4,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz,
                    size: 16,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
            ),
            Text(
              '${model.text}',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: klblack,
                  height: 1.3),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(bottom: 10, top: 5),
            //   child: Container(
            //     width: double.infinity,
            //     child: Wrap(
            //       children: [
            //         Padding(
            //           padding: const EdgeInsetsDirectional.only(
            //             end: 10,
            //           ),
            //           child: Container(
            //             height: 25,
            //             child: MaterialButton(
            //               minWidth: 1.0,
            //               padding: EdgeInsets.zero,
            //               onPressed: () {},
            //               child: Text(
            //                 '#softwoar',
            //                 style: Theme.of(context)
            //                     .textTheme
            //                     .caption
            //                     .copyWith(color: kdefulatColor),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsetsDirectional.only(
            //             end: 10,
            //           ),
            //           child: Container(
            //             height: 25,
            //             child: MaterialButton(
            //               minWidth: 1.0,
            //               padding: EdgeInsets.zero,
            //               onPressed: () {},
            //               child: Text(
            //                 '#flutter',
            //                 style: Theme.of(context)
            //                     .textTheme
            //                     .caption
            //                     .copyWith(color: kdefulatColor),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsetsDirectional.only(
            //             end: 10,
            //           ),
            //           child: Container(
            //             height: 25,
            //             child: MaterialButton(
            //               minWidth: 1.0,
            //               padding: EdgeInsets.zero,
            //               onPressed: () {},
            //               child: Text(
            //                 '#dart',
            //                 style: Theme.of(context)
            //                     .textTheme
            //                     .caption
            //                     .copyWith(color: kdefulatColor),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            if (model.postImage != '')
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 15,
                ),
                child: Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      4.0,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        '${model.postImage}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Icon(
                              IconBroken.Heart,
                              size: 16,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "0",
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              IconBroken.Chat,
                              size: 16,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "0 comments",
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(
                              '${SoucialCubit.get(context).userModel.image}'),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          "write a comment ...",
                          style: Theme.of(context).textTheme.caption.copyWith(),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    SoucialCubit.get(context)
                        .likePost(SoucialCubit.get(context).postsId[index]);
                  },
                  child: Row(
                    children: [
                      Icon(
                        IconBroken.Heart,
                        size: 16,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Like",
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
