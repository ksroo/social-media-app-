abstract class SocialSignUpStates {}

class SocialSignUpInitialStates extends SocialSignUpStates {}

class SocialSignUpLoadingStates extends SocialSignUpStates {}

class SocialSignUpSuccessStates extends SocialSignUpStates {}

class SocialSignUpErrorStates extends SocialSignUpStates {
  final String error;
  SocialSignUpErrorStates(this.error);
}

class SocialCreateUserSuccessStates extends SocialSignUpStates {}

class SocialCreateUserErrorStates extends SocialSignUpStates {
  final String error;
  SocialCreateUserErrorStates(this.error);
}

class SocialSignUpShowPasswordStates extends SocialSignUpStates {}
