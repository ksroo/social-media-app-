import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/bloc/state.dart';
import 'package:social_media_app/model/post_model.dart';
import 'package:social_media_app/model/user_model.dart';
import 'package:social_media_app/screens/chats/chat_screen.dart';
import 'package:social_media_app/screens/feeds/feeds_screen.dart';
import 'package:social_media_app/screens/new_post/new_post_screen.dart';
import 'package:social_media_app/screens/settings/settings_screen.dart';
import 'package:social_media_app/screens/users/users_screen.dart';
import 'package:social_media_app/utils/links.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SoucialCubit extends Cubit<SoucialState> {
  SoucialCubit() : super(SoucialInitialState());

  static SoucialCubit get(context) => BlocProvider.of(context);

  UserModel userModel;


  void getUserData() {
    emit(SoucialGetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data());
      emit(SoucialGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SoucialGetUserErrorState(error.toString()));
    });
  }

  int curentIndex = 0;

  List<Widget> screens = [
    FeedsScreen(),
    ChatScreen(),
    NewPostScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];

  List<String> title = [
    'Home',
    'Chats',
    'Post',
    'Users',
    'Settings',
  ];

  void changeBottonNav(int index) {
    if (index == 2)
      emit(SoucialNewPostState());
    else {
      curentIndex = index;
      emit(SoucialChangeBottomNavState());
    }
  }

  File profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SoucialProfileImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SoucialProfileImagePickedErrorState());
    }
  }

  File coverImage;
  Future<void> getCoverImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SoucialCaverImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SoucialCaverImagePickedErrorState());
    }
  }

  void uploadProfileImage({
    @required String name,
    @required String phone,
    @required String bio,
  }) {
    emit(SoucialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(SoucialUploadProfileImageSuccessState());
        print(value);
        updataUser(
          name: name,
          bio: bio,
          phone: phone,
          image: value,
        );
      }).catchError((error) {
        emit(SoucialUploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(SoucialUploadProfileImageErrorState());
    });
  }

  void uploadCoverImage({
    @required String name,
    @required String phone,
    @required String bio,
  }) {
    emit(SoucialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage.path).pathSegments.last}')
        .putFile(coverImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(SoucialUploadCaverImageSuccessState());
        print(value);
        updataUser(
          name: name,
          bio: bio,
          phone: phone,
          cover: value,
        );
      }).catchError((error) {
        emit(SoucialUploadCaverImageErrorState());
      });
    }).catchError((error) {
      emit(SoucialUploadCaverImageErrorState());
    });
  }

  // void updateUserImages({
  //   @required String name,
  //   @required String phone,
  //   @required String bio,
  // }) {
  //   emit(SoucialUserUpdateLoadingState());
  //   if (coverImage != null) {
  //     uploadCoverImage();
  //   } else if (profileImage != null) {
  //     uploadProfileImage();
  //   } else if (coverImage != null && profileImage != null) {
  //   } else {
  //     updataUser(
  //        name: name,
  //        bio: bio,
  //        phone: phone,
  //     );
  //   }
  // }

  void updataUser({
    @required String name,
    @required String phone,
    @required String bio,
    String cover,
    String image,
  }) {
    UserModel model = UserModel(
      phone: phone,
      name: name,
      isEmailVerified: false,
      bio: bio,
      email: userModel.email,
      cover: cover ?? userModel.cover,
      image: image ?? userModel.image,
      uId: userModel.uId,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(SoucialUserUpdateErrorState());
    });
  }

  File postImage;
  Future<void> getPostImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(SoucialPostImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SoucialPostImagePickedErrorState());
    }
  }

  void removePostImage() {
    postImage = null;
    emit(SoucialRemovePostImageState());
  }

  void uploadPostImage({
    @required String dateTime,
    @required String text,
  }) {
    emit(SoucialCreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage.path).pathSegments.last}')
        .putFile(postImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        createPost(
          text: text,
          dateTime: dateTime,
          postImage: value,
        );
      }).catchError((error) {
        emit(SoucialCreatePostErrorState());
      });
    }).catchError((error) {
      emit(SoucialCreatePostErrorState());
    });
  }

  void createPost({
    @required String dateTime,
    @required String text,
    String postImage,
  }) {
    emit(SoucialCreatePostLoadingState());
    PostModel model = PostModel(
      name: userModel.name,
      image: userModel.image,
      uId: userModel.uId,
      dateTime: dateTime,
      text: text,
      postImage: postImage ?? '',
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value) {
      emit(SoucialCreatePostSuccessState());
    }).catchError((error) {
      emit(SoucialCreatePostErrorState());
    });
  }

  List<PostModel> posts = [];
  List<String> postsId = [];

  void getPosts() {
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      value.docs.forEach((element) {
        postsId.add(element.id);
        posts.add(PostModel.fromJson(element.data()));
      });
      emit(SoucialGetPostsSuccessState());
    }).catchError((error) {
      emit(SoucialGetPostsErrorState(error.toString()));
    });
  }

  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel.uId)
        .set({
      'like': true,
    }).then((value) {
      emit(SoucialLikepostSuccessState());
    }).catchError((error) {
      emit(SoucialLikePostErrorState(error.toString()));
    });
  }
}
