import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/model/user_model.dart';
import 'package:social_media_app/screens/signup/bloc/state.dart';

class SocialSignUpCubit extends Cubit<SocialSignUpStates> {
  SocialSignUpCubit() : super(SocialSignUpInitialStates());

  static SocialSignUpCubit get(context) => BlocProvider.of(context);

  void userSignUp({
    @required String name,
    @required String email,
    @required String password,
    @required String phone,
  }) {
    emit(SocialSignUpLoadingStates());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user.email);
      print(value.user.uid);
      userCreat(
        uId: value.user.uid,
        email: email,
        phone: phone,
        name: name,
      );
    }).catchError(
      (error) {
        print(error.toString());
        emit(SocialSignUpErrorStates(error.toString()));
      },
    );
  }

  void userCreat({
    @required String name,
    @required String email,
    @required String phone,
    @required String uId,
  }) {
    UserModel model = UserModel(
      email: email,
      phone: phone,
      uId: uId,
      name: name,
      isEmailVerified: false,
      bio: 'write you bio ...',
      image:
          'https://image.freepik.com/free-photo/medium-shot-parents-kid-floor_23-2148920092.jpg',
      cover:
          'https://image.freepik.com/free-photo/medium-shot-parents-kid-floor_23-2148920092.jpg',
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(
          model.toMap(),
        )
        .then((value) {
      emit(SocialCreateUserSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(SocialCreateUserErrorStates(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void showPassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialSignUpShowPasswordStates());
  }
}
