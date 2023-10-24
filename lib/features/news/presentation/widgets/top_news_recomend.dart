import 'package:flutter/material.dart';
import 'package:news_app/common/theme.dart';


class HighLightWidget extends StatelessWidget {
  const HighLightWidget({
    super.key,
    required this.isEquals,
    required this.author,
    required this.obscarakter,
    required this.title,
  });

  final bool isEquals;
  final String author;
  final String obscarakter;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: isEquals ? 0 : 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: kBackgroundButton),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  author,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  obscarakter,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  '',
                  style: TextStyle(
                      color: Colors.grey[50],
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w500),
            )
          ]),
    );
  }
}
