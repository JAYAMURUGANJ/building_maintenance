import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'complaint.dart';
import 'constants.dart';
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
      home: const TimelineComponent(),
    );
  }
}

class TimelineComponent extends StatefulWidget {
  const TimelineComponent({Key? key}) : super(key: key);

  @override
  State<TimelineComponent> createState() => _TimelineComponentState();
}

class _TimelineComponentState extends State<TimelineComponent> {
  late List<Complaint> response;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    response = [];
    GrievanceService.getComplaints().then((value) {
      setState(() {
        response = value;
        isLoading = false;
      });
    });
  }

  final List<Color> listOfColors = [
    Constants.kPurpleColor,
    Constants.kGreenColor,
    Constants.kRedColor
  ];

  @override
  Widget build(BuildContext context) {
    Random random = Random();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.amber,
          padding: const EdgeInsets.all(20.0),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image.asset("assets/img/cleaning.png"),
                          title: Text(response[3]
                              .complaintCategory!
                              .toUpperCase()
                              .toString()),
                          subtitle: Text(response[3]
                              .complaintDescription!
                              .capitalize()
                              .toString()),
                        ),
                        const Divider(
                          thickness: 2.0,
                        ),
                        Flexible(
                          child: ListView.builder(
                              shrinkWrap: true,
                              // physics: const NeverScrollableScrollPhysics(),
                              itemCount: response[3].complaintStatus!.length,
                              itemBuilder: (context, i) {
                                return Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 60.0, left: 30.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(response[3]
                                              .complaintStatus![i]
                                              .level
                                              .toString()),
                                          Text(
                                            response[3]
                                                .complaintStatus![i]
                                                .action
                                                .toString(),
                                          ),
                                          Text(DateFormat(
                                                  "EEE, d MMM yyyy HH:mm:ss")
                                              .format(DateTime.parse(response[3]
                                                  .complaintStatus![i]
                                                  .complaintUpdatedDateTime
                                                  .toString()))),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      left: 10,
                                      child: Container(
                                        height: 120,
                                        width: 2.0,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    Positioned(
                                      // bottom: 5,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 60.0),
                                        child: Container(
                                          height: 20.0,
                                          width: 20.0,
                                          decoration: BoxDecoration(
                                            color:
                                                listOfColors[random.nextInt(3)],
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
