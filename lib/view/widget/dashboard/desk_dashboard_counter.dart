import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants.dart';

var counterBoardList = const [
  DashBoardCounterCard(
    title: "TOTAL",
    value: 20,
    textColor: Color(0xFFFFFFFF),
    cardColor: Color(0xFFea117e),
    icon: Icons.account_balance_wallet,
  ),
  DashBoardCounterCard(
    title: "PENDING",
    value: 2,
    textColor: Color(0xFFFFFFFF),
    cardColor: Color(0xFFf96131),
    icon: Icons.pending,
  ),
  DashBoardCounterCard(
    title: "SOLVED",
    value: 16,
    textColor: Color(0xFFFFFFFF),
    cardColor: Color(0xFF00a78e),
    icon: Icons.thumb_up,
  ),
  DashBoardCounterCard(
    title: "UN SOLVED",
    value: 4,
    textColor: Color(0xFFFFFFFF),
    cardColor: Color(0xFF55acee),
    icon: Icons.thumb_down,
  ),
];

class DashboardCounter extends StatelessWidget {
  const DashboardCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Constants.isMobile(context) == false
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: counterBoardList.toList())
        : Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(),
              child: Row(children: counterBoardList.toList()),
            ),
          );
  }
}

class DashBoardCounterCard extends StatelessWidget {
  final String? title;
  final int? value;
  final Color? textColor;
  final Color? cardColor;
  final IconData? icon;

  const DashBoardCounterCard(
      {Key? key,
      this.title,
      this.value,
      this.textColor,
      this.cardColor,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double mediaWidth = MediaQuery.of(context).size.width;
    return Constants.isMobile(context) == false
        ? Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
                color: cardColor,
                width: Constants.isDesktop(context) == true
                    ? mediaWidth / 6.2
                    : Constants.isTablet(context) == true
                        ? mediaWidth / 5.2
                        : mediaWidth / 4.2,
                height: 100,
                padding: Constants.isDesktop(context) == true
                    ? const EdgeInsets.all(10.0)
                    : Constants.isTablet(context) == true
                        ? const EdgeInsets.all(7.0)
                        : const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: Colors.white,
                      size: Constants.isDesktop(context) == true ? 50 : 30.0,
                    ),
                    const VerticalDivider(
                      width: 5.0,
                      color: Colors.white,
                    ),
                    Column(
                        mainAxisAlignment: Constants.isDesktop(context) == true
                            ? MainAxisAlignment.spaceEvenly
                            : MainAxisAlignment.center,
                        children: [
                          SelectableText(
                            title!,
                            style: GoogleFonts.lato(
                                color: textColor,
                                fontSize: Constants.isDesktop(context) == true
                                    ? 18
                                    : 12.8,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          SelectableText(
                            value.toString(),
                            style: GoogleFonts.lato(
                                color: textColor,
                                fontSize: Constants.isDesktop(context) == true
                                    ? 18
                                    : 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ],
                )))
        : Container(
            color: cardColor,
            width: MediaQuery.of(context).size.width / 4.5,
            height: 60.0,
            padding: const EdgeInsets.all(10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectableText(
                    title!,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 8.5,
                        fontWeight: FontWeight.bold),
                  ),
                  SelectableText(
                    value.toString(),
                    style: TextStyle(
                        color: textColor,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
          );
  }
}
