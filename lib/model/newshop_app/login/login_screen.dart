import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:noteappflutter/model/newshop_app/login/bloc/cubit.dart';
import 'package:noteappflutter/sharecomponent/shareprefrances.dart';

import '../newshop_screen/home_screen.dart';
import 'bloc/state.dart';

class Login_Screen extends StatelessWidget {
  var emailController=TextEditingController();
  var passowrdController=TextEditingController();
  var formkey =GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewShopCubit(),
      child: BlocConsumer<NewShopCubit,NewShopLoginStates>(
        listener: (context,state){
          if(state is NewShopSucssesState)
            {
              if(state.newmodeldata!.status==true)
                {
                  print(state.newmodeldata!.data!.token);
                  print(state.newmodeldata!.message);
                  sharepref.SaveData(key: 'token', value:state.newmodeldata!.message ).then((value) {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => NewShoHome_Screen(),), (route) => false);
                  });


                }
              else
              {
                print(state.newmodeldata!.message);
                Fluttertoast.showToast(
                    msg: state.newmodeldata!.message.toString(),
                  backgroundColor: Colors.deepPurpleAccent,
                  textColor: Colors.white,
                  toastLength: Toast.LENGTH_LONG,
                  timeInSecForIosWeb: 5,
                  gravity: ToastGravity.BOTTOM,
                );

              }

            }
        },
        builder: (context,state){
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
                          onFieldSubmitted:(value) =>  NewShopCubit.get(context).newpostdata(Email: emailController.text, Password: passowrdController.text) ,
                          controller:passowrdController,
                          validator: (value){
                            if(value!.isEmpty)
                              {
                                return 'plez enter your password';
                              }
                            },
                          obscureText: NewShopCubit.get(context).passhide,

                          decoration: InputDecoration(
                            label: Text('Password'),
                            prefixIcon: Icon(Icons.password_outlined),
                            suffixIcon:IconButton(onPressed: (){
                            NewShopCubit.get(context).changepassowerdicon();

                            },icon: Icon(NewShopCubit.get(context).defultpassIcon)),

                          ),
                        ),
                        SizedBox(height: 20,),
                        Center(child:
                        ConditionalBuilder(
                          condition: state is! NewShopLoadingState,
                          builder: (BuildContext context) =>MaterialButton(
                            onPressed: (){
                              if(formkey.currentState!.validate())
                                {
                                  NewShopCubit.get(context).newpostdata(Email: emailController.text, Password: passowrdController.text);
                                }
                            },height: 30,color: Colors.purple,child: Text('Login'),textColor: Colors.white,),
                          fallback: (BuildContext context) =>Center(child: CircularProgressIndicator()),
                        )),
                        Row(
                          children: [
                            Text('New preson ?',style:TextStyle(fontSize: 15),),
                            SizedBox(width: 10,),
                            TextButton(onPressed: (){}, child: Text('Sign UP',style: TextStyle(color: Colors.purple,fontSize: 18,fontWeight: FontWeight.bold),))


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
