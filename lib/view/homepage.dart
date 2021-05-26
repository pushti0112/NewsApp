import 'package:flutter/material.dart';
import 'package:newsapp/Provider/list_provider.dart';
import 'package:newsapp/controller/news_controller.dart';
import 'package:newsapp/controller/source_controller.dart';
import 'package:newsapp/models/source_model.dart';
import 'package:newsapp/news_tile.dart';
import 'package:newsapp/size_config.dart';
import 'package:newsapp/sourcecard.dart';
import 'package:provider/provider.dart';
import 'package:newsapp/size_config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  TextEditingController key= TextEditingController();

  var newslist=[];

  List<SourceModel> sources = [];
  ListProvider listProvider;


  void getNews() async {
    NewsController newsController = NewsController();
    listProvider = Provider.of<ListProvider>(context, listen: false);
    listProvider.loading = true;
    listProvider.newslist=[];
    if(listProvider.newslist.isNotEmpty){
      listProvider.newslist.clear();
    }
    listProvider.newslist = await newsController.getNews();
    listProvider.loading = false;


    listProvider.notifyListeners();
  }

  void getSearchNews(String searchkey) async {
    NewsController newsController = NewsController();
    listProvider = Provider.of<ListProvider>(context, listen: false);
    listProvider.loading = true;
    listProvider.newslist=[];
    if(listProvider.newslist.isNotEmpty){
      listProvider.newslist.clear();
    }
    listProvider.newslist = await newsController.getNewsbySearch(searchkey);
    listProvider.loading = false;


    listProvider.notifyListeners();
  }


  @override
  void initState() {

    // TODO: implement initState
    super.initState();

    sources = getSources();
    getNews();

  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.house, color: Colors.transparent,),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter",
              style:
              TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: <Widget>[
          Container(
              child: IconButton(
                  icon: Icon(Icons.home_rounded,),
                onPressed: (){ getNews();},
              )
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column (
                children: <Widget> [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
              child: TextFormField(
                onEditingComplete:(){
                  getSearchNews(key.text);
                  FocusScope.of(context).unfocus();
                  key.clear();
                  },
                controller: key,
              keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius:  BorderRadius.all(
                       Radius.circular(getProportionateScreenWidth(30)),
                    ),
                  ),
                  hintText: "                        Search Latest News",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: (){},
                ),
                ),
              ),
            ),
              SizedBox(height: getProportionateScreenHeight(15),),
                  // filter by sources and recent first
                      Container(
                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
                      height: 70,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: sources.length,
                          itemBuilder: (context, index) {
                            return SourceCard(
                              imageAssetUrl: sources[index].imageAssetUrl,
                              sourceName: sources[index].SourceName,
                              sourceKey: sources[index].SourceKey,
                            );
                          }),
                    ),
                  SizedBox(height: getProportionateScreenHeight(10),),

                  Consumer<ListProvider>(
                    builder: (_, ListProvider listprovider,child) {
                      return listprovider.loading?Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: getProportionateScreenHeight(200)),
                          child: CircularProgressIndicator(),
                        ),
                      )
                          :listProvider.newslist.length==0?Container(
                          child:Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: getProportionateScreenHeight(200)),
                              child: Text("No Data Found."),
                            ),
                          ))
                          :Container(
                        margin: EdgeInsets.only(top: getProportionateScreenWidth(16)),
                        child: ListView.builder(
                            itemCount: listprovider.newslist.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NewsTile(
                                imgUrl: listprovider.newslist[index].urlToImage ?? "",
                                title: listprovider.newslist[index].title ?? "",
                                desc: listprovider.newslist[index].description ?? "",
                                content: listprovider.newslist[index].content ?? "",
                                posturl: listprovider.newslist[index].articleUrl ?? "",
                              );
                            }),
                      );
                    }
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }


}







