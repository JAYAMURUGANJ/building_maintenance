import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../complaint.dart';
import '../service.dart';

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

  // final List<Color> listOfColors = [
  //   Constants.kPurpleColor,
  //   Constants.kGreenColor,
  //   Constants.kRedColor
  // ];

  late Color statusBgColor;

  @override
  Widget build(BuildContext context) {
    statusColor(String status) {
      switch (status) {
        case 'Success':
          statusBgColor = const Color(0xFF00a78e);
          break;
        case 'Pending':
          statusBgColor = const Color(0xFFf96131);
          break;
        default:
          statusBgColor = const Color(0xFF55acee);
      }
      return statusBgColor;
    }

    late int lastStatusId = response[3].complaintStatus!.length - 1;
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      trailing: Container(
                        height: 20.0,
                        width: 20.0,
                        decoration: BoxDecoration(
                          color: statusColor(response[3]
                              .complaintStatus![lastStatusId]
                              .action
                              .toString()),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 2.0,
                    ),
                    Flexible(
                      child: ListView.builder(
                          shrinkWrap: true,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                      Text(
                                          DateFormat("EEE, d MMM yyyy HH:mm:ss")
                                              .format(DateTime.parse(response[3]
                                                  .complaintStatus![i]
                                                  .complaintUpdatedDateTime
                                                  .toString()))),
                                    ],
                                  ),
                                ),
                                i == lastStatusId
                                    ? const SizedBox(
                                        height: 2.0,
                                      )
                                    : Positioned(
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
                                        color: statusColor(response[3]
                                            .complaintStatus![i]
                                            .action
                                            .toString()),
                                        borderRadius: BorderRadius.circular(20),
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
    );
  }
}
