
abstract class SocialLoginStates {}



class SocialLoginInitState extends SocialLoginStates{}




class SocialLoginLoadingState extends SocialLoginStates{}

class SocialLoginSucssesState extends SocialLoginStates{
  String uid;
  SocialLoginSucssesState(this.uid);

}

class SocialLoginErrorState extends SocialLoginStates{
  final String Error;
  SocialLoginErrorState(this.Error);
}





class SocialLoginChangepassIcon extends SocialLoginStates{}