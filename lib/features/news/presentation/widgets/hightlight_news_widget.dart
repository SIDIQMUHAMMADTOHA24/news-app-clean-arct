import 'package:flutter/material.dart';
import 'package:news_app/common/theme.dart';

class HighLightWidget extends StatelessWidget {
  const HighLightWidget({
    super.key,
    required this.isEquals,
    this.author = '',
    this.obscarakter = '',
    this.title = '',
    this.time = '',
  });

  final bool isEquals;
  final String author;
  final String obscarakter;
  final String title;
  final String time;
  @override
  Widget build(BuildContext context) {
    return (author.isNotEmpty &&
            obscarakter.isNotEmpty &&
            title.isNotEmpty &&
            time.isNotEmpty)
        ? Container(
            padding: const EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(
                horizontal: 5, vertical: isEquals ? 22 : 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: kBackgroundButton,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 7.5, offset: Offset(0, 5))
                ]),
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
                            color: Colors.white70,
                            fontSize: 23,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        time,
                        style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 19,
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
          )
        : Container(
            padding: const EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(
                horizontal: 5, vertical: isEquals ? 0 : 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: kGreyColor),
          );
  }
}
