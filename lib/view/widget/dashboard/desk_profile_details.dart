import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeskProfileDetails extends StatelessWidget {
  final double? mediaWidth;
  const DeskProfileDetails({Key? key, this.mediaWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
            const WebProfileCard(profileImage: "assets/img/profile.jpg"),
          ],
        )
      ]),
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
