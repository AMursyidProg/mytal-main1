import 'package:flutter/material.dart';
import 'package:mytal/data/model/response/article_model.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/screens/webview_screen.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ArticleModel> articles = [
      ArticleModel(
        title: "Against the odds: a story of living with thalassaemia",
        excerpt:
            "Imagine having a genetic disorder that means your body produces little or no haemoglobin, which red blood cells use to transport oxygen around the body.",
        site: "Deutsche Bank",
        url: "https://www.db.com/news/detail/20230616-against-the-odds-a-story-of-living-with-thalassaemia?language_id=1",
        date: "16 June 2023",
      ),
      ArticleModel(
        title: "‘Thank you, my love’: Malaysian couple parts ways over rare blood disorder",
        excerpt:
            "The couple, both doctors at the same hospital, both have thalassaemia, a hereditary blood disorder that can result in anaemia and require regular blood transfusions.",
        site: "South China Morning Post",
        url:
            "https://www.scmp.com/news/asia/southeast-asia/article/3223179/malaysian-couple-parts-ways-over-rare-blood-disorder-could-endanger-future-baby",
        date: "7 June 2023",
      ),
      ArticleModel(
          title: "Get blood disorder test before marriage",
          excerpt:
              "Thalassaemia is an inherited blood disorder that can be passed on. Severe thalassaemia can result in the death of foetuses or the need for lifelong blood transfusions.",
          site: "New Straits Times",
          url: "https://www.nst.com.my/opinion/letters/2023/05/908012/get-blood-disorder-test-marriage",
          date: "10 May 2023"),
      ArticleModel(
        title: "Knowledge of thalassaemia vital for preventing the condition",
        excerpt:
            "YESTERDAY was International Thalassaemia Day, a day devoted to educating the public and policymakers about thalassaemia and encouraging the global thalassaemia community to come together.",
        site: "The Star",
        url: "https://www.thestar.com.my/opinion/letters/2023/05/09/knowledge-of-thalassaemia-vital-for-preventing-the-condition",
        date: "9 May 2023",
      ),
      ArticleModel(
        title: "World Thalassaemia Day 2023: Date, theme, history, significance",
        excerpt:
            "Thalassaemia is an inherited disorder characterized by reduced levels of oxygen-carrying proteins, known as haemoglobin, and fewer red blood cells than normal.",
        site: "The Economic Times",
        url:
            "https://economictimes.indiatimes.com/news/new-updates/world-thalassaemia-day-2023-date-theme-history-significance/articleshow/100069438.cms?from=mdr",
        date: "8 May 2023",
      ),
    ];

    Theme.of(context).primaryColor; // Without this line, theme title not updating on switch

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: articles.length,
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall),
          child: Divider(color: Colors.grey[300]),
        ),
        itemBuilder: (context, index) {
          var article = articles[index];
          return InkWell(
            key: UniqueKey(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WebviewScreen(article: article)),
              );
            },
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                article.site,
                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeSmall),
              ),
              const SizedBox(height: Dimensions.paddingSizeExtraSmall),
              Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: Dimensions.paddingSizeExtraSmall),
              Text(
                article.excerpt,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: Dimensions.paddingSizeExtraSmall),
              Text(
                article.date,
                style: const TextStyle(color: Colors.grey, fontSize: Dimensions.fontSizeSmall),
              )
            ]),
          );
        },
      ),
    );
  }
}
