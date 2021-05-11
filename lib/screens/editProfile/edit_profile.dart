import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:social_media_app/bloc/cubit.dart';
import 'package:social_media_app/bloc/state.dart';
import 'package:social_media_app/components/app_bar.dart';
import 'package:social_media_app/components/text_button.dart';
import 'package:social_media_app/components/text_from_field.dart';

import 'package:social_media_app/utils/app_color.dart';
import 'package:social_media_app/utils/icon_broken.dart';
import 'package:social_media_app/widgets/customElevatedButton.dart';

class EditProfile extends StatelessWidget {
  static const routeName = '/EditProfile';

  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SoucialCubit, SoucialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SoucialCubit.get(context).userModel;
        var profileImage = SoucialCubit.get(context).profileImage;
        var coverImage = SoucialCubit.get(context).profileImage;

        nameController.text = userModel.name;
        bioController.text = userModel.bio;
        phoneController.text = userModel.phone;

        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Edit Profile',
            actions: [
              textButton(
                color: kBlue,
                fontSize: 18,
                onPressed: () {
                  SoucialCubit.get(context).updataUser(
                    bio: bioController.text,
                    name: nameController.text,
                    phone: phoneController.text,
                  );
                },
                text: 'Update',
              ),
            ],
          ),
          body: SingleChildScrollView(
                      child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (state is SoucialUserUpdateLoadingState)
                    LinearProgressIndicator(),
                  if (state is SoucialUserUpdateLoadingState)
                    SizedBox(
                      height: 10,
                    ),
                  Container(
                    height: 190,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 140,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4),
                                  ),
                                  image: DecorationImage(
                                    image: coverImage == null
                                        ? NetworkImage(
                                            '${userModel.cover}',
                                          )
                                        : FileImage(coverImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: CircleAvatar(
                                  backgroundColor: kBlue,
                                  radius: 20,
                                  child: Icon(
                                    IconBroken.Camera,
                                    color: kwhite,
                                    size: 20,
                                  ),
                                ),
                                onPressed: () {
                                  SoucialCubit.get(context).getCoverImage();
                                },
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 64,
                              backgroundColor: kwhite,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage: profileImage == null
                                    ? NetworkImage(
                                        '${userModel.image}',
                                      )
                                    : FileImage(profileImage),
                              ),
                            ),
                            IconButton(
                              icon: CircleAvatar(
                                backgroundColor: kBlue,
                                radius: 20,
                                child: Icon(
                                  IconBroken.Camera,
                                  color: kwhite,
                                  size: 20,
                                ),
                              ),
                              onPressed: () {
                                SoucialCubit.get(context).getProfileImage();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (SoucialCubit.get(context).profileImage != null ||
                      SoucialCubit.get(context).coverImage != null)
                    Row(
                      children: [
                        if (SoucialCubit.get(context).profileImage != null)
                          Expanded(
                            child: Column(
                              children: [
                                CustomElevatedButton(
                                  fontSize: 16,
                                  onPressed: () {
                                    SoucialCubit.get(context).uploadProfileImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      bio: bioController.text,
                                    );
                                  },
                                  horizontal: 30,
                                  vertical: 7,
                                  text: 'upload profile',
                                ),
                                if (state is SoucialUserUpdateLoadingState)
                                SizedBox(
                                  height: 5,
                                ),
                                if (state is SoucialUserUpdateLoadingState)
                                LinearProgressIndicator(),
                              ],
                            ),
                          ),
                        if (SoucialCubit.get(context).coverImage != null)
                          Expanded(
                            child: Column(
                              children: [
                                CustomElevatedButton(
                                  fontSize: 16,
                                  onPressed: () {
                                      SoucialCubit.get(context).uploadCoverImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      bio: bioController.text,
                                    );
                                  },
                                  horizontal: 30,
                                  vertical: 7,
                                  text: 'upload cover',
                                ),
                                if (state is SoucialUserUpdateLoadingState)
                                SizedBox(
                                  height: 5,
                                ),
                                if (state is SoucialUserUpdateLoadingState)
                                LinearProgressIndicator(),
                              ],
                            ),
                          ),
                      ],
                    ),
                  if (SoucialCubit.get(context).profileImage != null ||
                      SoucialCubit.get(context).coverImage != null)
                    SizedBox(
                      height: 20,
                    ),
                  customTextFromField(
                    controller: nameController,
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(IconBroken.User),
                    ),
                    labelText: 'Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'name must not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  customTextFromField(
                    controller: bioController,
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        IconBroken.Info_Square,
                      ),
                    ),
                    labelText: 'Bio',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'name must not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  customTextFromField(
                    controller: phoneController,
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        IconBroken.Call,
                      ),
                    ),
                    labelText: 'Phone',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'phone number must not be empty';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
