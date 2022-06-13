abstract class SocialRigesterStates {}



class SocialRigesterInitState extends SocialRigesterStates{}




class SocialRigesterLoadingState extends SocialRigesterStates{}

class SocialRigesterSucssesState extends SocialRigesterStates{}

class SocialRigesterErrorState extends SocialRigesterStates{
  final String Error;
  SocialRigesterErrorState(this.Error);
}





class SocialCreateRigesterLoadingState extends SocialRigesterStates{}

class SocialCreateRigesterSucssesState extends SocialRigesterStates{}

class SocialCreateRigesterErrorState extends SocialRigesterStates{
  final String Error;
  SocialCreateRigesterErrorState(this.Error);
}




class SocialRigesterChangepassIcon extends SocialRigesterStates{}