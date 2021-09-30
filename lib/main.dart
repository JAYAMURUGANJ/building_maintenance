import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'complaint.dart';
import 'constants.dart';
import 'events.dart';

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
  // List<Complaint> data = [];
  // late bool moreData;
  // late int current;
  // static const int max = 2;
  // late List<Complaint> response;

  // @override
  // void initState() {
  //   super.initState();
  //   current = 0;
  //   response = [];
  //   fetchComplaintDetails().then((value) {
  //     response = value;
  //     data.addAll(response.sublist(current, max));
  //     print(data);
  //   });
  //   moreData = true;
  // }

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

  final List<Complaint> SingleComplaintFlow = [
    Complaint(
        complaintCategory: "Civil",
        complaintType: "Pipe Complaint",
        complaintDescription: "Bathroom pipe is not working",
        complaintStatus: <ComplaintStatus>[
          ComplaintStatus(
              action: "Forword",
              level: "level1",
              complaintCreatedDateTime: "2021-05-05 14:00:00",
              complaintUpdatedDateTime: "2021-05-05 14:00:00"),
          ComplaintStatus(
              action: "Pending",
              level: "level2",
              complaintCreatedDateTime: "2021-05-07 15:00:00",
              complaintUpdatedDateTime: "2021-05-08 10:00:00")
        ])
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

    // var str = "2019-04-05 14:00:51.000";
    // print(str); // 2019-04-05 14:00:51.000
    // DateTime dt = DateTime.parse(str);
    // print(DateFormat("EEE, d MMM yyyy HH:mm:ss").format(dt));

    // var statusDate = DateFormat("EEE, d MMM yyyy HH:mm:ss").format(dt);
    var output = SingleComplaintFlow[0].complaintStatus;
    return Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: output!.length,
          itemBuilder: (context, i) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Row(
                    children: [
                      SizedBox(width: size.width * 0.1),
                      SizedBox(
                        child: Text(DateFormat("EEE, d MMM yyyy HH:mm:ss")
                            .format(DateTime.parse(output![i]
                                .complaintUpdatedDateTime
                                .toString()))),
                        width: size.width * 0.2,
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(output[i].level.toString()),
                            Text(
                              output[i].action.toString(),
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
