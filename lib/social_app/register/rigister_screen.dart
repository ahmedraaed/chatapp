import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/social_app/register/bloc_register/cubit.dart';
import 'package:noteappflutter/social_app/register/bloc_register/state.dart';
import 'package:noteappflutter/social_app/social_home.dart';

class SocialResgisterScreen extends StatelessWidget {
  const SocialResgisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (BuildContext context)  =>   SocialRigesterCubit(),
      child: BlocConsumer<SocialRigesterCubit,SocialRigesterStates>(
        listener: (context, state) => {
          if(state is SocialCreateRigesterSucssesState)
            {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SocialHomeScreen(),), (route) => true),
            }
        },
        builder: (context, state)  {
          var emailController=TextEditingController();
          var passowrdController=TextEditingController();
          var phoneController=TextEditingController();
          var usernameController=TextEditingController();
          var formkey =GlobalKey<FormState>();

          return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sign up',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      // Text('Login to show the market ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),

                      TextFormField(
                        controller:usernameController ,

                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'plez enter your username';
                          }
                        },
                        decoration: InputDecoration(
                          label: Text('UserName'),
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(height: 20,),

                      TextFormField(
                        controller:emailController ,

                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'plez enter your Email';
                          }
                        },
                        decoration: InputDecoration(
                          label: Text('Email'),
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      SizedBox(height: 20,),

                      TextFormField(
                        controller:phoneController ,

                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'plez enter your phone';
                          }
                        },
                        decoration: InputDecoration(
                          label: Text('phone'),
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        //  onFieldSubmitted:(value) =>  SocialLoginCubit.get(context).Logindata(Email: emailController.text, Password: passowrdController.text) ,
                        controller:passowrdController,
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'plez enter your password';
                          }
                        },
                        obscureText: SocialRigesterCubit.get(context).passhide,

                        decoration: InputDecoration(
                          label: Text('Password'),
                          prefixIcon: Icon(Icons.password_outlined),
                          suffixIcon:IconButton(onPressed: (){
                            SocialRigesterCubit.get(context).changepassowerdicon();

                          },icon: Icon(SocialRigesterCubit.get(context).defultpassIcon)),

                        ),
                      ),
                      SizedBox(height: 20,),



                      Center(child:
                      ConditionalBuilder(
                        condition: state is! SocialRigesterLoadingState,
                        builder: (BuildContext context) =>MaterialButton(
                          onPressed: (){
                            if(formkey.currentState!.validate())
                            {
                              SocialRigesterCubit.get(context).userregister(email: emailController.text, password: passowrdController.text, username: usernameController.text, phone: phoneController.text,);
                            }
                          },height: 30,color: Colors.purple,child: Text('Login'),textColor: Colors.white,),
                        fallback: (BuildContext context) =>Center(child: CircularProgressIndicator()),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );}
      ),
    );
  }
}
