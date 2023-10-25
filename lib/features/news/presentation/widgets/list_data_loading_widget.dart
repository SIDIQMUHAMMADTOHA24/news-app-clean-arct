import 'package:flutter/material.dart';
import 'package:news_app/common/theme.dart';

class ListDataLoading extends StatelessWidget {
  const ListDataLoading({
    Key? key,
    this.screenWidth,
  }) : super(key: key);

  final double? screenWidth;

  @override
  Widget build(BuildContext context) {
    double handleScreenWidthifNull = MediaQuery.of(context).size.width * 0.53;
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                color: kGreyColor, borderRadius: BorderRadius.circular(20)),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Container(
                height: 70,
                width: screenWidth ?? handleScreenWidthifNull,
                decoration: BoxDecoration(
                    color: kGreyColor, borderRadius: BorderRadius.circular(15)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 40,
                width: screenWidth ?? handleScreenWidthifNull,
                decoration: BoxDecoration(
                    color: kGreyColor, borderRadius: BorderRadius.circular(13)),
              )
            ],
          )
        ],
      ),
    );
  }
}
