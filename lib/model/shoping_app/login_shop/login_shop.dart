import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:noteappflutter/model/shoping_app/bloc_shoping/shop_bloc.dart';
import 'package:noteappflutter/model/shoping_app/bloc_shoping/shop_state.dart';
import 'package:noteappflutter/model/shoping_app/login_shop/rigister_screen.dart';
import 'package:noteappflutter/model/shoping_app/shop_layout.dart';
import 'package:noteappflutter/sharecomponent/shareprefrances.dart';

import '../../../sharecomponent/contant.dart';

class LoginScreenSop extends StatelessWidget {
  const LoginScreenSop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    var keyform=GlobalKey<FormState>();



    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit() ,
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener: (context, state)  {
          if(state is ShopLoginSucssesState)
            {
              if(state.loginData.status)
                {
                  sharepref.SaveData(key: 'token', value: state.loginData.data?.token).then((value)
                  {
                    Navigationpushremove(context, Shop_Layout(), false);

                  });

                }else
                  {
                    ShowToast(text:state.loginData.message );
                  }
            }
        },
        builder: (context,state)=>Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: keyform,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Login",style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.black,),),
                      SizedBox(height: 30,),
                      TextFormField(
                        validator: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'email is empty';
                          }
                        },
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,

                        decoration: InputDecoration(

                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',
                        ),

                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        validator: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'password is empty';
                          }
                        },
                        onFieldSubmitted: (value){
                          if(keyform.currentState!.validate())
                          {
                            ShopLoginCubit.get(context).userLogin(email: emailController.text, password: passwordController.text);
                          }
                        },
                        controller: passwordController,
                        keyboardType: TextInputType.number,
                        obscureText: ShopLoginCubit.get(context).issecured,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password_sharp),
                          suffixIcon: IconButton(
                            onPressed: ()
                            {
                              ShopLoginCubit.get(context).changepassowerdstate();
                            },
                            icon: Icon(ShopLoginCubit.get(context).passicon,),
                          ),
                          labelText: 'Password',
                        ),

                      ),
                      SizedBox(height: 40,),
                      ConditionalBuilder(
                        condition:state  is! ShopLoginLodingState ,
                        builder:(context)=> MaterialButton(onPressed: (){


                          if(keyform.currentState!.validate())
                            {
                              ShopLoginCubit.get(context).userLogin(email: emailController.text, password: passwordController.text);
                            }
//
                        },
                          color: Colors.blue,
                          height: 30,
                          child: Text("Login",style: TextStyle(color: Colors.white),),
                        ),
                        fallback: (context)=>Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Now One ? ",style: TextStyle(color: Colors.black54),),

                          TextButton(onPressed: (){
                            Navigat(context,RegisterScreen());
                          }, child: Text("New Account",style: TextStyle(color: Colors.deepPurple,fontSize: 13,),)),
                        ],
                      )


                    ],
                  ),
                ),
              ),
            ),
          ),

        ),
      ),
    );
  }
}
