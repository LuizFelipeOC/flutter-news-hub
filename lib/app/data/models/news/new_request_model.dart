class NewsRequestModel {
  int page;
  int perPage;
  String strategy;

  NewsRequestModel({this.page = 1, this.perPage = 10, this.strategy = 'new'});
}
