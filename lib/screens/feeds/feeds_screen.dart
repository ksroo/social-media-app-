import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/bloc/cubit.dart';
import 'package:social_media_app/bloc/state.dart';
import 'package:social_media_app/utils/app_color.dart';

import 'package:social_media_app/widgets/buildPostItem.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SoucialCubit, SoucialState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
          condition: SoucialCubit.get(context).posts.length > 0 &&SoucialCubit.get(context).userModel != null ,
          builder: (context) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 10,
                  margin: EdgeInsets.all(8),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Image(
                        image: NetworkImage(
                          'https://image.freepik.com/free-photo/delighted-handsome-man-points-screen-smartphone-smiles-joyfully-wears-optical-glasses-hat-tshirt_273609-30675.jpg',
                        ),
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "communicate with friends",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: kwhite,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: SoucialCubit.get(context).posts.length,
                  itemBuilder: (context, index) =>
                      BuildPostItem(SoucialCubit.get(context).posts[index]),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 8,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
