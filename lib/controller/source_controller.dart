
import 'package:newsapp/models/source_model.dart';

List<SourceModel> getSources(){

  List<SourceModel> mySources =[];
  SourceModel sourceModel;

  //1
  sourceModel = new SourceModel();
  sourceModel.SourceName = "Recent First";
  sourceModel.imageAssetUrl = "https://images.unsplash.com/photo-1501139083538-0139583c060f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dGltZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  sourceModel.SourceKey="recent";
  mySources.add(sourceModel);

  //2
  sourceModel = new SourceModel();
  sourceModel.SourceName = "India";
  sourceModel.imageAssetUrl = "https://images.unsplash.com/photo-1517427677506-ade074eb1432?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGluZGlhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  sourceModel.SourceKey="in";
  mySources.add(sourceModel);

  //3
  sourceModel = new SourceModel();
  sourceModel.SourceName = "US";
  sourceModel.imageAssetUrl = "https://images.unsplash.com/photo-1551822620-21205daf9f3b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDN8fHVzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  sourceModel.SourceKey="us";
  mySources.add(sourceModel);

  //4
  sourceModel = new SourceModel();
  sourceModel.SourceName = "UK";
  sourceModel.imageAssetUrl = "https://images.unsplash.com/photo-1585511686939-43e83dc0134a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fHVrfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  sourceModel.SourceKey="gb";
  mySources.add(sourceModel);

  //5
  sourceModel = new SourceModel();
  sourceModel.SourceName = "Canada";
  sourceModel.imageAssetUrl = "https://images.unsplash.com/photo-1519832979-6fa011b87667?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y2FuYWRhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  sourceModel.SourceKey="ca";
  mySources.add(sourceModel);

  //6
  sourceModel = new SourceModel();
  sourceModel.SourceName = "Australia";
  sourceModel.imageAssetUrl = "https://images.unsplash.com/photo-1493375366763-3ed5e0e6d8ec?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fGF1c3RyYWxpYXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  sourceModel.SourceKey="au";
  mySources.add(sourceModel);

  //7
  sourceModel = new SourceModel();
  sourceModel.SourceName = "Italy";
  sourceModel.imageAssetUrl = "https://images.unsplash.com/photo-1525874684015-58379d421a52?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8aXRhbHl8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  sourceModel.SourceKey="it";
  mySources.add(sourceModel);

  return mySources;

}