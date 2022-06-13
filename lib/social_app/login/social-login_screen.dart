import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/sharecomponent/shareprefrances.dart';
import 'package:noteappflutter/social_app/login/bloc/cubit.dart';
import 'package:noteappflutter/social_app/login/bloc/state.dart';
import 'package:noteappflutter/social_app/register/rigister_screen.dart';

import '../social_home.dart';

class SocialOginScreen extends StatelessWidget {
  const SocialOginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)  =>SocialLoginCubit(),

      child: BlocConsumer<SocialLoginCubit,SocialLoginStates>(
        listener: (context, state) => {
      //    if(state is SocialLoginErrorState)
      //      {
      //     Fluttertoast.showToast(
      //     msg: 'state.Error',
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.blue,
      //     textColor: Colors.white,
      //     fontSize: 16.0
      // )
       //     }
          if (state is SocialLoginSucssesState)
            {
              sharepref.SaveData(key: 'uid', value:state.uid ).then((value)
              {
                print(value);

                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SocialHomeScreen(),), (route) => false);

              })


            }
        },
        builder: (context, state)  {
          var emailController=TextEditingController();
          var passowrdController=TextEditingController();
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
                        Text('LOGIN',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        Text('Login to show the market ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
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
                          onFieldSubmitted:(value) =>  SocialLoginCubit.get(context).Logindata(Email: emailController.text, Password: passowrdController.text) ,
                          controller:passowrdController,
                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return 'plez enter your password';
                            }
                          },
                          obscureText: SocialLoginCubit.get(context).passhide,

                          decoration: InputDecoration(
                            label: Text('Password'),
                            prefixIcon: Icon(Icons.password_outlined),
                            suffixIcon:IconButton(onPressed: (){
                              SocialLoginCubit.get(context).changepassowerdicon();

                            },icon: Icon(SocialLoginCubit.get(context).defultpassIcon)),

                          ),
                        ),
                        SizedBox(height: 20,),
                        Center(child:
                        ConditionalBuilder(
                          condition: state is! SocialLoginLoadingState,
                          builder: (BuildContext context) =>MaterialButton(
                            onPressed: (){
                              if(formkey.currentState!.validate())
                              {
                                SocialLoginCubit.get(context).Logindata(Email: emailController.text, Password: passowrdController.text) ;
                              }
                            },height: 30,color: Colors.purple,child: Text('Login'),textColor: Colors.white,),
                          fallback: (BuildContext context) =>Center(child: CircularProgressIndicator()),
                        )),
                        Row(
                          children: [
                            Text('New preson ?',style:TextStyle(fontSize: 15),),
                            SizedBox(width: 10,),
                            TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SocialResgisterScreen(),));
                            }, child: Text('Sign UP',style: TextStyle(color: Colors.purple,fontSize: 18,fontWeight: FontWeight.bold),))
                          ],
                        ),
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
}
