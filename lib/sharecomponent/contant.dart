import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:noteappflutter/layout/news_screens/web_page.dart';
import 'package:noteappflutter/model/shoping_app/login_shop/login_shop.dart';

Widget ArticalItems(artical, context) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(artical['urlToImage']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        '${artical['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                  SizedBox(
                    height: 1,
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(
                        '${artical['publishedAt']}',
                        style: Theme.of(context).textTheme.bodyText2,
                      )),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );

Widget CustomArtical(cubit) {
  return cubit.length == 0
      ? Center(child: CircularProgressIndicator())
      : ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  Navigat(
                      context,
                      WebViewScreen(
                        cubit[index]['url'],
                      ));
                },
                child: ArticalItems(cubit[index], context));
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 10,
              width: double.infinity,
              color: Colors.black12,
            );
          },
          itemCount: cubit.length,
        );
}

void Navigat(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void Navigationpushremove(
  context,
  widget,
  killpage,
) {
  Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => widget), (route) => killpage);
}


void ShowToast({required String text})=> Fluttertoast.showToast(
  msg: text,
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.CENTER,
  timeInSecForIosWeb: 5,
  backgroundColor: Colors.deepPurple,
  textColor: Colors.white,
  fontSize: 16.0,
);


void SignOut(context)
{
  var sharepref;
  sharepref.RmoveData(key: 'token').then((value)
  {
    if(value)
    {
      Navigationpushremove(context, LoginScreenSop(), false);
    }
  });
}
void printFullText(String text)
{
  final pattern =RegExp('.{1,800}');
  pattern.allMatches(text).forEach((element) {print(element.group(0));});
}
String? token;



String? uid;