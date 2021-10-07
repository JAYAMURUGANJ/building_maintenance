import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../complaint.dart';
import '../../constants.dart';

class DeskComplaintList extends StatefulWidget {
  const DeskComplaintList({Key? key}) : super(key: key);

  @override
  DeskComplaintListState createState() => DeskComplaintListState();
}

class DeskComplaintListState extends State<DeskComplaintList> {
  List<Complaint> data = [];
  late bool moreData;
  late int current;
  static const int max = 3;
  late List<Complaint> response;

  @override
  void initState() {
    super.initState();
    current = 0;
    response = [];
    fetchComplaintDetails().then((value) {
      response = value;
      data.addAll(response.sublist(current, max));
      setState(() {});
    });
    moreData = true;
  }

  @override
  Widget build(BuildContext context) {
    final double mediaWidth = MediaQuery.of(context).size.width;
    final ScrollController controller = ScrollController();
    return LimitedBox(
      maxWidth: mediaWidth / 1.42,
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: controller,
            itemCount: moreData ? data.length + 1 : data.length,
            itemBuilder: (BuildContext context, int index) {
              if (data.length == index) {
                return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: OutlinedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  side: const BorderSide(color: Colors.red)))),
                      child:
                          const Icon(Icons.arrow_forward, color: Colors.grey),
                      onPressed: () {
                        setState(() {
                          current = current + max;
                          if (current + max >= response.length) {
                            moreData = false; //make this when you reach at end

                            data.addAll(
                                response.sublist(current, response.length));
                          } else {
                            data.addAll(
                                response.sublist(current, max + current));
                            moreData = true;
                          }
                        });
                      },
                    ));
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ComplainCard(
                    complaintCategory: data[index].complaintCategory,
                    complaintType: data[index].complaintType,
                    complaintDescription: data[index].complaintDescription,
                    complaintStatus: data[index]
                        .complaintStatus![
                            data[index].complaintStatus!.length - 1]
                        .action,
                    levelOfComplaint: data[index]
                        .complaintStatus![
                            data[index].complaintStatus!.length - 1]
                        .level,
                    lastUpdatedDate: data[index]
                        .complaintStatus![
                            data[index].complaintStatus!.length - 1]
                        .complaintUpdatedDateTime,
                  ),
                );
              }
            }),
      ),
      maxHeight: mediaWidth / 8,
    );
  }

  Future<List<Complaint>> fetchComplaintDetails() async {
    final response = await http.get(
        Uri.parse('https://rtionline.tn.gov.in/sscsr/sscsr/complaint.php'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON. ProfileInfo.fromJson(json.decode(response.body))
      // Iterable l = json.decode(response.body);

      List<Complaint> list = List<Complaint>.from(
          (json.decode(response.body) as List)
              .map((i) => Complaint.fromJson(i)));
      return list;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

//ComplainCard Widget
class ComplainCard extends StatelessWidget {
  final String? complaintCategory;
  final String? complaintType;
  final String? complaintDescription;
  final String? complaintStatus;
  final String? levelOfComplaint;
  final String? lastUpdatedDate;

  const ComplainCard({
    Key? key,
    this.complaintCategory,
    this.complaintType,
    this.complaintDescription,
    this.complaintStatus,
    this.levelOfComplaint,
    this.lastUpdatedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imgUrl;
    switch (complaintCategory) {
      case 'Civil':
        imgUrl = "assets/img/civil.png";
        break;
      case 'Eelectrical':
        imgUrl = "assets/img/eb.png";
        break;
      case 'Horticulture':
        imgUrl = "assets/img/horticulture.png";
        break;
      case 'Cleaning':
        imgUrl = "assets/img/cleaning.png";
        break;
      default:
        imgUrl = "assets/img/civil.png";
    }
    Color statusBgColor;
    switch (complaintStatus) {
      case 'Success':
        statusBgColor = const Color(0xFF00a78e);
        break;
      case 'Pending':
        statusBgColor = const Color(0xFFf96131);
        break;
      default:
        statusBgColor = const Color(0xFF55acee);
    }

    //To change timestamp into proper date formate
    var str = lastUpdatedDate;
    DateTime dt = DateTime.parse(str!);
    var statusDate = DateFormat("EEE, d MMM yyyy HH:mm:ss").format(dt);

    final double mediaWidth = MediaQuery.of(context).size.width;
    return Card(
      child: InkWell(
        child: SizedBox(
          width: mediaWidth / 4,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100.0,
                      height: 80.0,
                      child: Image.network(
                        imgUrl,
                      ),
                    ),
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SelectableText(
                              complaintCategory!,
                              style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SelectableText(
                              "( $complaintType )",
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 12,
                                //decoration: TextDecoration.underline,
                              ),
                            ),
                            Text(
                              complaintDescription!,
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          levelOfComplaint!.capitalize(),
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          statusDate.toString(),
                          style: GoogleFonts.lato(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                ),

                //Complaint status bar
                Container(
                  color: statusBgColor,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        complaintStatus!.toUpperCase(),
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
