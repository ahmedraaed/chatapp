import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:noteappflutter/model/shoping_app/login_shop/login_shop.dart';
import 'package:noteappflutter/sharecomponent/shareprefrances.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../sharecomponent/contant.dart';

class BoardModel {
  String image;
  String TiltleText;
  String BodyText;
  BoardModel(
      {required this.image, required this.TiltleText, required this.BodyText});
}

class OnBordingShopingScreen extends StatelessWidget {
  var pagecontroller = PageController();
  List<BoardModel> Boardlist = [
    BoardModel(
        image: 'image/market2.png',
        TiltleText: 'Screen Tittle1',
        BodyText: 'Screen Body1'),
    BoardModel(
        image: 'image/market2.png',
        TiltleText: 'Screen Tittle2',
        BodyText: 'Screen Body2'),
    BoardModel(
        image: 'image/market2.png',
        TiltleText: 'Screen Tittle3',
        BodyText: 'Screen Body3'),
  ];
  bool islast = false;

  void submmit(context)
  {
    sharepref.SaveData(key: 'onbording', value: true).then(
        (value)
            {
              if(value)
                {
                  Navigationpushremove(context, LoginScreenSop(), false);

                }
            }

    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                submmit(context);
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  color: HexColor('#690059'),
                ),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
              controller: pagecontroller,
              onPageChanged: (index) {
                if (index == Boardlist.length - 1) {
                  islast = true;
                } else {
                  islast = false;
                }
              },
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildBoardingItem(
                Boardlist[index],
              ),
              itemCount: Boardlist.length,
            )),
            SizedBox(height: 80),
            Row(
              children: [
                SmoothPageIndicator(
                    effect: ColorTransitionEffect(
                      dotColor: HexColor('#ffd4ff'),
                      dotHeight: 10,
                      dotWidth: 10,
                      activeDotColor: HexColor('#690059'),
                    ),
                    controller: pagecontroller,
                    count: Boardlist.length),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (islast == true) {
                      submmit(context);
                    } else {
                      pagecontroller.nextPage(
                          duration: Duration(milliseconds: 800),
                          curve: Curves.decelerate);
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward,
                  ),
                  backgroundColor: HexColor('#690059'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Image(
            image: AssetImage(model.image),
          )),
          SizedBox(
            height: 20,
          ),
          Text(
            model.TiltleText,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            model.BodyText,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      );

}
