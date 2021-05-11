import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/screens/homeScreen/homeScreen.dart';
import 'package:social_media_app/screens/login/bloc/cubit.dart';
import 'package:social_media_app/screens/login/bloc/state.dart';
import 'package:social_media_app/services/shared_pref/cache_helper.dart';
import 'package:social_media_app/utils/app_color.dart';
import 'package:social_media_app/utils/app_images.dart';
import 'package:social_media_app/widgets/customElevatedButton.dart';
import 'package:social_media_app/widgets/showToast.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> fromkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        listener: (context, state) {
          if (state is SocialLoginErrorStates) {
            showToast(
              text: state.error,
              state: ToastStates.ERROR,
            );
          }
          if (state is SocialLoginSuccessStates) {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then(
              (value) {
                Navigator.pushReplacementNamed(context, HomeScreen.rouateName);
              },
            );
          }
        },
        builder: (context, state) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: kLightpurple,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Form(
                    key: fromkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor: kBlue,
                                child: Icon(Icons.close_outlined),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Welcome\nBack",
                              style: TextStyle(
                                letterSpacing: 10,
                                color: klblack,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            AppImages.group,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "LogIn",
                              style: TextStyle(
                                fontSize: 25,
                                color: klblack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        customTextFromField(
                          keyboardType: TextInputType.emailAddress,
                          labelText: 'Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: kBlue,
                          ),
                          controller: emailController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'email cant be empity';
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customTextFromField(
                          keyboardType: TextInputType.emailAddress,
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.lock_open,
                            color: kBlue,
                          ),
                          isPassword: SocialLoginCubit.get(context).isPassword,
                          suffix: SocialLoginCubit.get(context).suffix,
                          suffixPressed: () {
                            SocialLoginCubit.get(context).showPassword();
                          },
                          controller: passwordController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'password cant be empity';
                            }
                          },
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: kBlue,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Phone Login",
                                      style: TextStyle(
                                        color: klblack,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forget Password",
                                    style: TextStyle(
                                        color: klblack,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        CustomElevatedButton(
                          fontSize: 20,
                          horizontal: 60,
                          vertical: 7,
                          text: "Log in",
                          onPressed: () {
                            if (fromkey.currentState.validate()) {
                              SocialLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                height: 2,
                                width: 30,
                                color: kBlue,
                              ),
                            ),
                            Text("OR"),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                height: 2,
                                width: 30,
                                color: kBlue,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                AppImages.facebook,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                AppImages.google,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       "if you not have account",
                        //       style: TextStyle(
                        //         fontSize: 14,
                        //         color: klblack,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //     TextButton(
                        //       onPressed: () {
                        //         Navigator.of(context)
                        //             .pushReplacementNamed(SignUpScreen.routeName);
                        //       },
                        //       child: Text(
                        //         "Sign In",
                        //         style: TextStyle(
                        //           fontSize: 16,
                        //           color: kBlue,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget customTextFromField({
    @required String labelText,
    @required Widget prefixIcon,
    bool isPassword = false,
    IconData suffix,
    @required TextEditingController controller,
    @required Function validator,
    Function suffixPressed,
    @required TextInputType keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(color: klblack, fontWeight: FontWeight.bold),
        enableInteractiveSelection: false,
        obscureText: isPassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: kwhite,
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(suffix),
                )
              : null,
          prefixIcon: prefixIcon,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 5,
              color: kBlue,
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kBlue,
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kBlue,
              style: BorderStyle.solid,
            ),
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
