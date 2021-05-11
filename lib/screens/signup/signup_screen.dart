import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/screens/homeScreen/homeScreen.dart';
import 'package:social_media_app/screens/signup/bloc/cubit.dart';
import 'package:social_media_app/screens/signup/bloc/state.dart';
import 'package:social_media_app/utils/app_color.dart';
import 'package:social_media_app/utils/app_images.dart';
import 'package:social_media_app/widgets/customElevatedButton.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/SignUpScreen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> fromkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialSignUpCubit(),
      child: BlocConsumer<SocialSignUpCubit, SocialSignUpStates>(
          listener: (context, state) {
        if (state is SocialCreateUserSuccessStates) {
          Navigator.pushReplacementNamed(context, HomeScreen.rouateName);
        }
      }, builder: (context, state) {
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
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 25,
                              color: klblack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      customTextFromField(
                          labelText: "Username",
                          prefixIcon: Icon(
                            Icons.person,
                            color: kBlue,
                          ),
                          controller: nameController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Username cant be empty";
                            }
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      customTextFromField(
                          labelText: 'Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: kBlue,
                          ),
                          controller: emailController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Email cant be empty";
                            }
                          }),

                      SizedBox(
                        height: 10,
                      ),
                      customTextFromField(
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.lock_open,
                            color: kBlue,
                          ),
                          isPassword: SocialSignUpCubit.get(context).isPassword,
                          suffix: SocialSignUpCubit.get(context).suffix,
                          controller: passwordController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Password cant be empty";
                            }
                          },
                          suffixPressed: () {
                            SocialSignUpCubit.get(context).showPassword();
                          }),

                      SizedBox(
                        height: 10,
                      ),
                      customTextFromField(
                          labelText: 'Phone',
                          prefixIcon: Icon(
                            Icons.phone,
                            color: kBlue,
                          ),
                          controller: phoneController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Phone cant be empty";
                            }
                          }),

                      SizedBox(
                        height: 20,
                      ),

                      ConditionalBuilder(
                        condition: state is! SocialSignUpLoadingStates,
                        fallback: (context) => Center(
                            child: CircularProgressIndicator(
                          color: kBlue,
                        )),
                        builder: (context) => CustomElevatedButton(
                          fontSize: 20,
                          horizontal: 60,
                          vertical: 7,
                          text: "Sign Up",
                          onPressed: () {
                            if (fromkey.currentState.validate()) {
                              SocialSignUpCubit.get(context).userSignUp(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text);
                            }
                          },
                        ),
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
                      //       "if you haven't any account",
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //         color: klblack,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //     TextButton(
                      //       onPressed: () {},
                      //       child: Text(
                      //         "Login In",
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
      }),
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
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        controller: controller,
        validator: validator,
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
