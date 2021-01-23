import 'package:flutter/material.dart';
import 'package:iNews/services/API.dart';
import 'package:iNews/models/News.dart';
import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var news = new List<News>();

  _getNews() {
    API.getNews().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        news = list.map((model) => News.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getNews();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iNews',
      home: Scaffold(
        backgroundColor: Color(0xFFD5D5D5),
        body: ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: ListTile(
                    title: Text(
                      news[index].title,
                      style: GoogleFonts.oswald(
                        textStyle: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      news[index].body,
                      style: GoogleFonts.oswald(
                        textStyle: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
