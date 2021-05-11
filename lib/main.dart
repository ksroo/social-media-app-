import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/bloc/cubit.dart';
import 'package:social_media_app/screens/editProfile/edit_profile.dart';
import 'package:social_media_app/screens/new_post/new_post_screen.dart';

import 'package:social_media_app/services/shared_pref/cache_helper.dart';
import 'package:social_media_app/utils/links.dart';
import '../screens/homeScreen/homeScreen.dart';

import 'screens/authLoginSingUp_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  uId = CacheHelper.getData(key: 'uId');

  Widget widget;

  if (uId != null) {
    widget = HomeScreen();
  } else {
    widget = AuthLoginSignUp();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp({this.startWidget});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => SoucialCubit()..getUserData()..getPosts(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            subtitle1: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              height: 1.3,
            ),
          ),
          fontFamily: 'Jannah',
        ),
        home: startWidget,
        routes: {
          HomeScreen.rouateName: (ctx) => HomeScreen(),
          NewPostScreen.routeName: (ctx) => NewPostScreen(),
          EditProfile.routeName: (ctx) => EditProfile(),
        },
      ),
    );
  }
}
