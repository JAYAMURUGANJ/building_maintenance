import 'package:flutter/material.dart';

class MobileProfileCard extends StatelessWidget {
  final String? profileImage;

  const MobileProfileCard({Key? key, this.profileImage}) : super(key: key);

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

class MobileProfileDetails extends StatelessWidget {
  const MobileProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 5, bottom: 0),
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
            MobileProfileCard(profileImage: "assets/img/profile.jpg"),
          ]),
    );
  }
}
