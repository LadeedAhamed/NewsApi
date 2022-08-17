import 'package:flutter/material.dart';
import 'package:news_api/cardprofile.dart';
import 'package:news_api/model/model_class.dart';
import 'package:news_api/services/api_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Article>> sampleData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData = fetchNewsApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
          title: const Center(
            child:Text(
        "HEADLINES",
        style: TextStyle(fontSize: 29, color: Colors.white,fontFamily: 'RobotoSlab',letterSpacing: 2 ,fontWeight: FontWeight.bold),
      ),
          )),
      body: Container(
        color:const Color(0xff464646),
        padding:const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<Article>>(
          future: sampleData,
          builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot){
            if(snapshot.hasData){
             List<Article>? articles = snapshot.data;
             return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (BuildContext context,int index,){
            return cardProfile(articles[index], context);
          },
          );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );

          },
        )
      ),
    );
  }
}
