import 'package:flutter/material.dart';
import 'package:news_api/model/model_class.dart';
import 'package:news_api/news_details.dart';

// class CardProfile extends StatelessWidget {
//   const CardProfile(Article articl, BuildContext context, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return
Widget cardProfile(Article article, BuildContext context) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => newsDetails(article, context)));
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 5.5 / 20,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  article.urlToImage ?? "",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
                bottom: 50,
                left: 12,
                right: 24,
                child: SizedBox(
                  width: 320,
                  child: Text(
                    article.title ?? "",
                    maxLines: 5,
                    //overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xfff2f2f2),
                        fontFamily: 'RobotoSlab'),
                  ),
                )),
            Positioned(
                bottom: 12,
                left: 12,
                child: RichText(
                    text: TextSpan(
                        text: article.source?.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffbababa),
                            fontSize: 12,
                            fontFamily: 'RobotoSlab'),
                        children:   [
                      TextSpan(
                          text:"    ${article.publishedAt}",
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Color(0xffbababa),
                              fontFamily: 'RobotoSlab'))
                    ])))
          ],
        ),
      ),
      const SizedBox(
        height: 24,
      )
    ],
  );
}
