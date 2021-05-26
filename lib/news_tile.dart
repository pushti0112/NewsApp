import 'package:flutter/material.dart';
import 'package:newsapp/size_config.dart';
import 'package:newsapp/view/news_posts.dart';

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  NewsTile({this.imgUrl, this.desc, this.title, this.content, @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => NewsPosts(
              postUrl: posturl,
            )
        ));
      },

      child: Container(
          margin: EdgeInsets.only(bottom: getProportionateScreenWidth(24)),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(getProportionateScreenWidth(6)),bottomLeft:  Radius.circular(getProportionateScreenWidth(6)))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(getProportionateScreenWidth(6)),
                      child: Image.network(
                        imgUrl,
                        height: getProportionateScreenWidth(200),
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: getProportionateScreenWidth(12),),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: getProportionateScreenWidth(20),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(4),
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize: getProportionateScreenWidth(14)),
                  )
                ],
              ),
            ),
          )),
    );
  }
}