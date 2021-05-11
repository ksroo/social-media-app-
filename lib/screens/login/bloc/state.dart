abstract class SocialLoginStates {}

class SocialLoginInitialStates extends SocialLoginStates {}

class SocialLoginLoadingStates extends SocialLoginStates {}

class SocialLoginSuccessStates extends SocialLoginStates {
  final String uId;

  SocialLoginSuccessStates(this.uId);

}

class SocialLoginErrorStates extends SocialLoginStates {
  String error;
  SocialLoginErrorStates(this.error);
}

class SocialLoginShowPasswordStates extends SocialLoginStates {}
