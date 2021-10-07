import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

import 'complaint.dart';
import 'constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xffe0e8f5),
        body: mediaWidth > Constants.tabmax
            ? SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProfileDetails(
                        mediaWidth: mediaWidth,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.black,
                            width: 250,
                            height: 600,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              SizedBox(height: 15.0),
                              CounterCard(),
                              ComplaintList(),
                            ],
                          )
                        ],
                      )
                    ]),
              )
            : SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ProfileDetails(
                        mediaWidth: mediaWidth,
                      ),
                      const SizedBox(height: 5.0),
                      const SubHeading(
                        title: "Complaint Category",
                        titleColor: Color(0xFF545353),
                      ),
                      CategoryType(),
                      CounterCard(),
                      SizedBox(height: 5.0),
                      ComplaintList(),
                    ]),
              ));
  }
}

class CounterCard extends StatelessWidget {
  const CounterCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(),
        child: Row(children: const [
          DashBoardCounterCard(
            title: "TOTAL",
            value: 20,
            textColor: Color(0xFFFFFFFF),
            cardColor: Color(0xFFea117e),
          ),
          DashBoardCounterCard(
            title: "PENDING",
            value: 2,
            textColor: Color(0xFFFFFFFF),
            cardColor: Color(0xFFf96131),
          ),
          DashBoardCounterCard(
            title: "SOLVED",
            value: 16,
            textColor: Color(0xFFFFFFFF),
            cardColor: Color(0xFF00a78e),
          ),
          DashBoardCounterCard(
            title: "UN SOLVED",
            value: 4,
            textColor: Color(0xFFFFFFFF),
            cardColor: Color(0xFF55acee),
          ),
        ]),
      ),
    );
  }
}

class CategoryType extends StatelessWidget {
  const CategoryType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: SizedBox(
          child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              children: const <Widget>[
                CategoryCard(
                    imgUrl: "assets/img/civil.png", categoryName: "Civil"),
                CategoryCard(
                    imgUrl: "assets/img/eb.png", categoryName: "Electrical"),
                CategoryCard(
                    imgUrl: "assets/img/horticulture.png",
                    categoryName: "Horticulture"),
                CategoryCard(
                    imgUrl: "assets/img/cleaning.png",
                    categoryName: "Cleaning"),
              ]),
          height: 90,
        ));
  }
}

class ProfileDetails extends StatelessWidget {
  final double? mediaWidth;
  const ProfileDetails({Key? key, this.mediaWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return mediaWidth! < Constants.tabmax
        ? Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 5, bottom: 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SelectableText(
                    "Hi' Jayamurugan...",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  ProfileCard(profileImage: "assets/img/profile.jpg"),
                ]),
          )
        : Container(
            color: Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.orange,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0, right: 55.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/img/logo.png',
                            width: 50,
                            height: 50,
                          ),
                          SelectableText(
                            "Grievance!.",
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: const [
                          SelectableText(
                            "Hi' Jayamurugan",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          SelectableText(
                            "JAMU03031996@GMAIL.COM",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const WebProfileCard(
                          profileImage: "assets/img/profile.jpg"),
                    ],
                  )
                ]),
          );
  }
}

class ProfileCard extends StatelessWidget {
  final String? profileImage;

  const ProfileCard({Key? key, this.profileImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        image: DecorationImage(
          image: AssetImage(profileImage!),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        border: Border.all(
          color: Colors.red,
          width: 3.0,
        ),
      ),
    );
  }
}

class WebProfileCard extends StatelessWidget {
  final String? profileImage;

  const WebProfileCard({Key? key, this.profileImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        image: DecorationImage(
          image: AssetImage(profileImage!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String? imgUrl;
  final String? categoryName;
  const CategoryCard({Key? key, this.imgUrl, this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      SizedBox(
        width: 80.0,
        height: 50.0,
        child: Image.asset(
          imgUrl!,
        ),
      ),
      const SizedBox(height: 3.0),
      SelectableText(
        categoryName!,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold),
      ),
    ]);
  }
}

class SubHeading extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  const SubHeading({Key? key, this.title, this.titleColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: SelectableText(
          title!,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: titleColor, fontSize: 12.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class DashBoardCounterCard extends StatelessWidget {
  final String? title;
  final int? value;
  final Color? textColor;
  final Color? cardColor;

  const DashBoardCounterCard(
      {Key? key, this.title, this.value, this.textColor, this.cardColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double mediaWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: cardColor,
        width:
            mediaWidth > Constants.webmin ? mediaWidth / 5.5 : mediaWidth / 6.3,
        height: MediaQuery.of(context).size.width / 12,
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.access_alarms,
              color: Colors.white,
              size: 50.0,
            ),
            const VerticalDivider(
              width: 5.0,
              color: Colors.white,
            ),
            Column(children: [
              SelectableText(
                title!,
                style: GoogleFonts.lato(
                    color: textColor,
                    fontSize: mediaWidth > Constants.webmin ? 20 : 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SelectableText(
                value.toString(),
                style: GoogleFonts.lato(
                    color: textColor,
                    fontSize: mediaWidth > Constants.webmin ? 20 : 15,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class ComplaintList extends StatefulWidget {
  const ComplaintList({Key? key}) : super(key: key);

  @override
  ComplaintListState createState() => ComplaintListState();
}

class ComplaintListState extends State<ComplaintList> {
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
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: LimitedBox(
        maxWidth: mediaWidth > Constants.webmin
            ? mediaWidth / 1.29
            : mediaWidth / 1.45,
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
                                    side:
                                        const BorderSide(color: Colors.red)))),
                        child:
                            const Icon(Icons.arrow_forward, color: Colors.grey),
                        onPressed: () {
                          setState(() {
                            current = current + max;
                            if (current + max >= response.length) {
                              moreData =
                                  false; //make this when you reach at end

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
                  return ComplainCard(
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
                  );
                }
              }),
        ),
        maxHeight: mediaWidth / 10,
      ),
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
          width: mediaWidth / 3,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SelectableText(
                              complaintCategory!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SelectableText(
                              complaintType!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            Text(
                              complaintDescription!,
                              style: const TextStyle(
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
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          statusDate.toString(),
                          style: const TextStyle(
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
                    child: Text(
                      "$complaintStatus...",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
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
