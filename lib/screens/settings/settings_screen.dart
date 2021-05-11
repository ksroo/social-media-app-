import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/bloc/cubit.dart';
import 'package:social_media_app/bloc/state.dart';
import 'package:social_media_app/screens/editProfile/edit_profile.dart';
import 'package:social_media_app/utils/app_color.dart';
import 'package:social_media_app/utils/icon_broken.dart';
import 'package:social_media_app/widgets/customElevatedButton.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SoucialCubit, SoucialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SoucialCubit.get(context).userModel;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 190,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        height: 140,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              '${userModel.cover}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 64,
                      backgroundColor: kwhite,
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage(
                          '${userModel.image}',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${userModel.name}",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                '${userModel.bio}',
                style: Theme.of(context).textTheme.caption,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              "289",
                              style: Theme.of(context).textTheme.subtitle2,
                              // style: TextStyle(

                              // fontSize: 18.0,
                              // fontWeight: FontWeight.w600,
                              // color: Colors.black,
                              // ),
                            ),
                            Text(
                              'Photos ',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              "11k",
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text(
                              'Followers',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              "40",
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text(
                              'Followings',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              "100",
                              style: Theme.of(context).textTheme.subtitle2,
                              // style: TextStyle(

                              // fontSize: 18.0,
                              // fontWeight: FontWeight.w600,
                              // color: Colors.black,
                              // ),
                            ),
                            Text(
                              'Posts',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: kBlue,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Add Photos',
                        style: TextStyle(
                            color: kwhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(backgroundColor: kBlue),
                    onPressed: () {
                      Navigator.pushNamed(context, EditProfile.routeName);
                    },
                    child: Icon(
                      IconBroken.Edit,
                      color: kwhite,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
