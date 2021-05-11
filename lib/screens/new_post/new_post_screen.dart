import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/bloc/cubit.dart';
import 'package:social_media_app/bloc/state.dart';
import 'package:social_media_app/components/app_bar.dart';
import 'package:social_media_app/components/text_button.dart';
import 'package:social_media_app/utils/app_color.dart';
import 'package:social_media_app/utils/icon_broken.dart';

class NewPostScreen extends StatelessWidget {
  static const routeName = '/NewPostScreen';

  TextEditingController textCotroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SoucialCubit, SoucialState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: "Create Post",
            actions: [
              textButton(
                onPressed: () {
                  var now = DateTime.now();
                  if (SoucialCubit.get(context).postImage == null) {
                    SoucialCubit.get(context).createPost(
                      dateTime: now.toString(),
                      text: textCotroller.text,
                    );
                  } else {
                    SoucialCubit.get(context).uploadPostImage(
                      dateTime: now.toString(),
                      text: textCotroller.text,
                    );
                  }
                },
                text: 'Post',
                color: kBlue,
                fontSize: 18,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (state is SoucialCreatePostLoadingState)
                  LinearProgressIndicator(),
                if (state is SoucialCreatePostLoadingState)
                  SizedBox(
                    height: 10.0,
                  ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://image.freepik.com/free-photo/portrait-young-beautiful-woman-gesticulating_273609-40514.jpg'),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Text(
                        "Walid Mahmoud",
                        style: TextStyle(
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textCotroller,
                    decoration: InputDecoration(
                      hintText: 'what is on your mind ...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                if (SoucialCubit.get(context).postImage != null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        height: 140,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          image: DecorationImage(
                            image:
                                FileImage(SoucialCubit.get(context).postImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: CircleAvatar(
                          backgroundColor: kBlue,
                          radius: 20,
                          child: Icon(
                            Icons.close,
                            color: kwhite,
                            size: 20,
                          ),
                        ),
                        onPressed: () {
                          SoucialCubit.get(context).removePostImage();
                        },
                      ),
                    ],
                  ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            SoucialCubit.get(context).getPostImage();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconBroken.Image,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("add photo"),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "# tags",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
