import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardCounter extends StatelessWidget {
  const DashboardCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
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
    ]);
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
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        color: cardColor,
        width: mediaWidth / 6.2,
        height: mediaWidth / 12,
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25.0,
              ),
              SelectableText(
                value.toString(),
                style: GoogleFonts.lato(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
