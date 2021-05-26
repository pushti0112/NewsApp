import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Provider/list_provider.dart';
import 'package:newsapp/size_config.dart';
import 'package:provider/provider.dart';

import 'controller/news_controller.dart';

class SourceCard extends StatefulWidget {
  final String imageAssetUrl, sourceName,sourceKey;

  SourceCard({this.imageAssetUrl, this.sourceName,this.sourceKey});

  @override
  _SourceCardState createState() => _SourceCardState();
}

class _SourceCardState extends State<SourceCard> {

  ListProvider listProvider;


  void getNewsbySources(String sourceKey) async {
    NewsController newsController = NewsController();

    listProvider = Provider.of<ListProvider>(context, listen: false);
    listProvider.loading = true;
    listProvider.newslist=[];

    if(listProvider.newslist.isNotEmpty){
      listProvider.newslist.clear();
    }

    listProvider.newslist = await newsController.getNewsbySources(sourceKey);

      listProvider.loading = false;
    listProvider.notifyListeners();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getNewsbySources(widget.sourceKey);
        },
      child: Container(
        margin: EdgeInsets.only(right: getProportionateScreenWidth(14)),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(getProportionateScreenWidth(30)),
              child: CachedNetworkImage(
                imageUrl: widget.imageAssetUrl,
                height: getProportionateScreenWidth(60),
                width: getProportionateScreenWidth(60),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: getProportionateScreenWidth(60),
              width: getProportionateScreenWidth(60),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(getProportionateScreenWidth(30)),
                  color: Colors.black26
              ),
              child: Text(
                widget.sourceName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(14),
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}