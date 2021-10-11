import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline/view/widget/dashboard/desk_category_type.dart';
import 'package:timeline/view/widget/dashboard/desk_complaint_list.dart';
import 'package:timeline/view/widget/dashboard/desk_dashboard_counter.dart';
import 'package:timeline/view/widget/dashboard/desk_pie_chart.dart';
import 'package:timeline/view/widget/dashboard/desk_profile_details.dart';
import 'package:timeline/view/widget/dashboard/desk_timeline.dart';
import 'package:timeline/view/widget/dashboard/mobile_profile_details.dart';
import 'package:timeline/view/widget/dashboard/subheading.dart';
import '../../utils/constants.dart';
import '../../utils/responsive.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: Constants.isMobile(context) == true
          ? AppBar(
              leading: Image.asset(
                'assets/img/logo.png',
                width: 50,
                height: 50,
              ),
              title: SelectableText(
                "Grievance!.",
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            )
          : null,
      backgroundColor: const Color(0xffe0e8f5),
      floatingActionButton: FloatingActionButton(
          disabledElevation: 0.0,
          hoverElevation: 10.0,
          backgroundColor: Colors.white,
          focusColor: Colors.blue,
          foregroundColor: Colors.amber,
          splashColor: Colors.orange,
          elevation: 0.0,
          child: Image.asset(
            "assets/img/add_complaint.png",
            width: 50,
            height: 40,
          ),
          // foregroundColor: Colors.white,
          onPressed: () {}),
      body: Responsive(
        desktop: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              DeskProfileDetails(
                mediaWidth: mediaWidth,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.black,
                    width: 250,
                    height: MediaQuery.of(context).size.height,
                  ),
                  Container(
                    color: const Color(0xFFcfcfcf),
                    width: 80,
                    height: MediaQuery.of(context).size.height,
                    child: const DeskCategoryType(),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 15.0),
                        const DashboardCounter(),
                        const DeskComplaintList(),
                        Wrap(
                          spacing: 8.0, // gap between adjacent chips
                          runSpacing: 4.0, // gap between lines
                          direction: Axis.horizontal,
                          children: const [
                            TimelineComponent(),
                            PieChartSample3(),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        tablet: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              DeskProfileDetails(
                mediaWidth: mediaWidth,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: const Color(0xFFcfcfcf),
                    width: 80,
                    height: Constants.isTablet(context) == false
                        ? MediaQuery.of(context).size.height
                        : 1050,
                    child: const DeskCategoryType(),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 15.0),
                        const DashboardCounter(),
                        const DeskComplaintList(),
                        Wrap(
                          spacing: 8.0, // gap between adjacent chips
                          runSpacing: 4.0, // gap between lines
                          direction: Axis.vertical,
                          children: const [
                            TimelineComponent(),
                            PieChartSample3(),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        mobile: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                MobileProfileDetails(),
                SizedBox(height: 5.0),
                SubHeading(
                  title: "Complaint Category",
                  titleColor: Color(0xFF545353),
                ),
                DeskCategoryType(),
                DashboardCounter(),
                DeskComplaintList(),
                TimelineComponent(),
                PieChartSample3(),
              ]),
        ),
      ),
    );
  }
}
