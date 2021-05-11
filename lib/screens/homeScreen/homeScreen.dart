import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/bloc/cubit.dart';
import 'package:social_media_app/bloc/state.dart';
import 'package:social_media_app/screens/new_post/new_post_screen.dart';
import 'package:social_media_app/utils/app_color.dart';
import 'package:social_media_app/utils/icon_broken.dart';

class HomeScreen extends StatelessWidget {
  static const rouateName = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SoucialCubit, SoucialState>(
      listener: (context, state) {
        if (state is SoucialNewPostState) {
          Navigator.pushNamed(context, NewPostScreen.routeName);
        }
      },
      builder: (context, state) {
        var cubit = SoucialCubit.get(context);

        return Scaffold(
          backgroundColor: kwhite,
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(
                  IconBroken.Notification,
                  color: klblack,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  IconBroken.Search,
                  color: klblack,
                ),
                onPressed: () {},
              ),
            ],
            title: Text(
              cubit.title[cubit.curentIndex],
              style: TextStyle(color: klblack, fontWeight: FontWeight.bold),
            ),
            backgroundColor: kLightpurple,
            elevation: 0,
          ),
          body: cubit.screens[cubit.curentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: klblack,
            unselectedItemColor: kBlue,
            type: BottomNavigationBarType.fixed,
            elevation: 20,
            backgroundColor: kLightpurple,
            currentIndex: cubit.curentIndex,
            onTap: (index) {
              cubit.changeBottonNav(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Home,
                  color: kBlue,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Chat,
                    color: kBlue,
                  ),
                  label: 'Chats'),
              BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Paper_Upload,
                    color: kBlue,
                  ),
                  label: 'Post'),
              BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Location,
                    color: kBlue,
                  ),
                  label: 'Users'),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Setting,
                  color: kBlue,
                ),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
