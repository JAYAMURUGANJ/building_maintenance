import 'dart:math';

import 'package:flutter/material.dart';

import 'complaint.dart';
import 'constants.dart';
import 'events.dart';
import 'service.dart';

void main() {
  runApp(const MyApp());
}

TextStyle style = const TextStyle(color: Colors.white);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timeline',
      theme: ThemeData(
        primaryColor: Constants.kPurpleColor,
      ),
      home: TimelineComponent(title: 'Timeline'),
    );
  }
}

class TimelineComponent extends StatefulWidget {
  TimelineComponent({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<TimelineComponent> createState() => _TimelineComponentState();
}

class _TimelineComponentState extends State<TimelineComponent> {
  List<Complaint> data = [];
  late bool moreData;
  late int current;
  static const int max = 2;
  late List<Complaint> response;

  @override
  void initState() {
    super.initState();
    current = 0;
    response = [];
    fetchComplaintDetails().then((value) {
      response = value;
      data.addAll(response.sublist(current, max));
      print(data);
    });
    moreData = true;
  }

  final List<Events> listOfEvents = [
    Events(time: "5pm", eventName: "New Icon", description: "Mobile App"),
    Events(
        time: "3 - 4pm", eventName: "Design Stand Up", description: "Hangouts"),
    Events(time: "12pm", eventName: "Lunch Break", description: "Main Room"),
    Events(
        time: "9 - 11am",
        eventName: "Finish Home Screen",
        description: "Web App"),
  ];

  final List<Color> listOfColors = [
    Constants.kPurpleColor,
    Constants.kGreenColor,
    Constants.kRedColor
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Random random = Random();
    return Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: listOfEvents.length,
          itemBuilder: (context, i) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Row(
                    children: [
                      SizedBox(width: size.width * 0.1),
                      SizedBox(
                        child: Text(listOfEvents[i].time),
                        width: size.width * 0.2,
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(listOfEvents[i].eventName),
                            Text(
                              listOfEvents[i].description,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 12),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 50,
                  child: Container(
                    height: size.height * 0.7,
                    width: 1.0,
                    color: Colors.grey.shade400,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: BoxDecoration(
                        color: listOfColors[random.nextInt(3)],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
