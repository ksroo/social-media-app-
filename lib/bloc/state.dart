abstract class SoucialState {}

class SoucialInitialState extends SoucialState {}
// get users

class SoucialGetUserLoadingState extends SoucialState {}

class SoucialGetUserSuccessState extends SoucialState {}

class SoucialGetUserErrorState extends SoucialState {
  final String error;

  SoucialGetUserErrorState(this.error);
}

// get posts

class SoucialGetPostsLoadingState extends SoucialState {}

class SoucialGetPostsSuccessState extends SoucialState {}

class SoucialGetPostsErrorState extends SoucialState {
  final String error;

  SoucialGetPostsErrorState(this.error);
}

class SoucialChangeBottomNavState  extends SoucialState{}


class SoucialNewPostState  extends SoucialState{}

class SoucialProfileImagePickedSuccessState  extends SoucialState{}

class SoucialProfileImagePickedErrorState  extends SoucialState{}


class SoucialCaverImagePickedSuccessState  extends SoucialState{}

class SoucialCaverImagePickedErrorState  extends SoucialState{}

class SoucialUploadProfileImageSuccessState  extends SoucialState{}

class SoucialUploadProfileImageErrorState  extends SoucialState{}

class SoucialUploadCaverImageSuccessState  extends SoucialState{}

class SoucialUploadCaverImageErrorState  extends SoucialState{}

class SoucialUserUpdateLoadingState  extends SoucialState{}

class SoucialUserUpdateErrorState  extends SoucialState{}

// create post
class SoucialCreatePostLoadingState  extends SoucialState{}

class SoucialCreatePostSuccessState  extends SoucialState{}

class SoucialCreatePostErrorState  extends SoucialState{}



class SoucialPostImagePickedSuccessState  extends SoucialState{}

class SoucialPostImagePickedErrorState  extends SoucialState{}

class SoucialRemovePostImageState  extends SoucialState{}

// Like  state



class SoucialLikepostSuccessState extends SoucialState {}

class SoucialLikePostErrorState extends SoucialState {
  final String error;

  SoucialLikePostErrorState(this.error);
}


