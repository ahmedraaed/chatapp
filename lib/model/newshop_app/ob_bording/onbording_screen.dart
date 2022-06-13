import 'package:flutter/material.dart';
import 'package:noteappflutter/model/newshop_app/login/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../sharecomponent/shareprefrances.dart';

class onbordingbody{
  String image;
  String title;
  String body;
  onbordingbody(this.image,this.title,this.body);
}
class OnBourding_Screen extends StatelessWidget {
   PageController pagecontroller=PageController();
    bool islast=false;

  List<onbordingbody> listbody=
      [
        onbordingbody('image/market2.png', 'header1' , 'body1' ),
        onbordingbody('image/market2.png', 'header2' , 'body2' ),
        onbordingbody('image/market2.png', 'header3' , 'body3' ),
      ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Shop App',style: TextStyle(color: Colors.black,),),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:
          [
            Expanded(
              child: PageView.builder(
                controller:pagecontroller ,
                  itemBuilder:(context,index)=> onbording(listbody[index]),
                onPageChanged: (index){
                  if(index==listbody.length-1)
                    {
                      islast=true;
                    }else
                      {
                        islast=false;
                      }

                },
                itemCount: listbody.length,
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(controller: pagecontroller,effect: ExpandingDotsEffect(
                  activeDotColor: Colors.deepPurple,
                  dotWidth: 10,
                  dotHeight: 10,
                  dotColor: Colors.black26,
                  spacing:8,
                ), count: listbody.length),
                Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    if(islast==true)
                      {
                        sharepref.SaveData(key: 'newonbording', value: true).then((value) {
                         print(value);
                          return Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login_Screen()),
                                  (route) => false);
                        }
                        );
                      }else
                        {
                          pagecontroller.nextPage(duration: Duration(milliseconds: 800), curve: Curves.easeInCirc);

                        }
                  },
                child: Icon(Icons.arrow_forward),),
              ],
            ),

         ],
        ),
      ),
    );
  }
  Widget onbording(onbordingbody model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(child: Image(image: AssetImage(model.image))),
      SizedBox(height:20 ,),
      Text( model.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      SizedBox(height: 20,),
      Text(model.body,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
    ],
  );
}
