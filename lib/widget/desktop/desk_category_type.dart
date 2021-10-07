import 'package:flutter/material.dart';

class DeskCategoryType extends StatelessWidget {
  const DeskCategoryType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 2.0, right: 2.0),
        child: SizedBox(
          child: Column(
              //scrollDirection: Axis.horizontal,
              //padding: const EdgeInsets.all(8),
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700),
      ),
    ]);
  }
}
