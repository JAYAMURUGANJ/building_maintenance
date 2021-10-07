import 'package:flutter/material.dart';
import 'package:timeline/widget/desktop/desk_category_type.dart';
import 'package:timeline/widget/desktop/desk_complaint_list.dart';
import 'package:timeline/widget/desktop/desk_dashboard_counter.dart';
import 'package:timeline/widget/desktop/desk_pie_chart.dart';
import 'package:timeline/widget/desktop/desk_profile_details.dart';
import 'package:timeline/widget/desktop/desk_timeline.dart';
import '../../responsive.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
                            children: [
                              const TimelineComponent(),
                              PieChartSample3(),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ]),
        ),
        tablet: Container(
          color: Colors.green,
        ),
        mobile: Container(
          color: Colors.black,
        ),
      ),
    );
  }
}
