import 'package:flutter/material.dart';
import 'package:news_api/model/model_class.dart';

// class NewsDetails extends StatelessWidget {
//   const NewsDetails({Key? key}) : super(key: key);

//   @override
Widget newsDetails(Article article, BuildContext context) {
  return Scaffold(
    body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                article.urlToImage ?? "",
              ))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 45,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.transparent,
              textColor: Colors.white,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.2,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 24),
              child: Column(
                children: [
                  SizedBox(
                    width: 400,
                    child: Text(
                      article.title ?? "",
                      maxLines: 5,
                      //overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 29,
                          color: Color(0xfff2f2f2),
                          fontFamily: 'RobotoSlab'),
                    ),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        article.source!.name ?? "",
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color(0xfff2f2f2),
                            fontFamily: 'RobotoSlab',
                            fontSize: 20),
                      ),
                      Text(
                        article.publishedAt.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color(0xfff2f2f2),
                            fontFamily: 'RobotoSlab',
                            fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    article.description ?? "",
                    style: const TextStyle(
                        color: Color(0xffbababa),
                        fontSize: 14,
                        fontFamily: 'RobotoSlab',
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
