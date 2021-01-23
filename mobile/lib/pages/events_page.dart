import 'package:flutter/material.dart';
import 'package:iNews/models/Events.dart';
import 'package:iNews/services/API.dart';
import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  var events = new List<Events>();

  _getEvents() {
    API.getEvents().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        events = list.map((model) => Events.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getEvents();
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
          itemCount: events.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        events[index].title,
                        style: GoogleFonts.oswald(
                          textStyle: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        events[index].description,
                        style: GoogleFonts.oswald(
                          textStyle: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Endereço: " + events[index].address,
                      style: GoogleFonts.oswald(
                        textStyle: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Text(
                      events[index].date + " as " + events[index].time,
                      style: GoogleFonts.oswald(
                        textStyle: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
