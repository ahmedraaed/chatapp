
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/social_app/cubit.dart';

import '../states.dart';

class EditProfileScreen extends StatelessWidget {
  //const EditProfileScreen({Key? key}) : super(key: key);

  TextEditingController Name=TextEditingController();
  TextEditingController bio=TextEditingController();
  TextEditingController phone=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocaialCubit,SocialGetUserStates>(
      listener: (context, state) {},
      builder: (context,state){
        var cubit =SocaialCubit.get(context).modelResgister;
        var profileimage =SocaialCubit.get(context).profileIamge;
        var coverImage=SocaialCubit.get(context).coverIamge;

        Name.text=cubit.name;
        bio.text=cubit.bio as String;
        phone.text=cubit.phone;

       return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            },icon: Icon(Icons.arrow_back_ios),color: Colors.indigo,),
            titleSpacing:0 ,

            title: Text('Edit',style: TextStyle(color: Colors.deepPurple),),
            actions: [
              TextButton(onPressed: (){
                // SocaialCubit.get(context).userUpdate(bio:bio.text , phone: phone.text, username: Name.text);
                SocaialCubit.get(context).UploadProfileIamge(bio: bio.text , phone: phone.text, username: Name.text);
                SocaialCubit.get(context).UpdateCoverIamge(bio: bio.text, phone: phone.text, username: Name.text);

              }, child:Text('Update',style: TextStyle(color: Colors.deepPurple,fontSize: 20),),
              ),
              SizedBox(width: 10,),
            ],
          ),
          body: Column(
            children: [
              if(state is SocialLoadingUpdate)
                LinearProgressIndicator(),
            Container(
            height: 190,
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children:[
                Align(
                  child:Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: coverImage ==null? NetworkImage('${cubit.cover}') : FileImage(coverImage) as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(backgroundColor: Colors.indigo,child: IconButton(onPressed: (){SocaialCubit.get(context).GetCoverIamge();}, icon: Icon(Icons.camera_alt),color: Colors.white,)),
                ),
              ],
            ),
                  alignment: AlignmentDirectional.topCenter,
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child:CircleAvatar(
                        backgroundImage: profileimage  == null ? NetworkImage('${cubit.image}') : FileImage(profileimage )as ImageProvider,
                        radius: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(backgroundColor: Colors.indigo,child: IconButton(onPressed: (){SocaialCubit.get(context).GetProfileImage();}, icon: Icon(Icons.camera_alt),color: Colors.white,)),
                    ),
                  ],
                ),

              ] ,
            ),
          ),
              SizedBox(height: 20,),
              TextFormField(
                controller: Name,
                keyboardType: TextInputType.name,

                decoration:InputDecoration (
                  label: Text('Name'),
                  prefixIcon: Icon(Icons.person),
                ),

                validator: (value)
                {
                  if(value==null)
                  {
                    return 'enter your name ';
                  }
                },

              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: bio,
                keyboardType: TextInputType.name,

                decoration:InputDecoration (
                  label: Text('bio'),
                  prefixIcon: Icon(Icons.integration_instructions_rounded),
                ),

                validator: (value)
                {
                  if(value==null)
                  {
                    return 'enter your bio ';
                  }
                },

              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,

                decoration:InputDecoration (
                  label: Text('phone'),
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value)
                {
                  if(value==null)
                  {
                    return 'enter your phone ';
                  }
                },

              ),


            ],
          ),
        );
      },

    );
  }
}
