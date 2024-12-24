class ArticleModel {
  String title;
  String excerpt;
  String site;
  String url;
  String date;

  ArticleModel({required this.title, required this.site, required this.url, required this.date, this.excerpt = ""});
}
