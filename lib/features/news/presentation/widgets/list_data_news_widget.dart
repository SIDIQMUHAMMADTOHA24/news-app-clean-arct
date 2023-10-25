import 'package:flutter/material.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:news_app/features/news/presentation/widgets/list_data_loading_widget.dart';

class ListDataWidget extends StatelessWidget {
  const ListDataWidget({
    Key? key,
    this.formattedDate,
    this.data,
  }) : super(key: key);

  final String? formattedDate;
  final Article? data;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.53;

    return data != null
        ? Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenWidth,
                      child: Text(
                        data!.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 15,
                        ),
                        const SizedBox(width: 7),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data!.author,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              formattedDate!,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        : const Column(
            children: [
              ListDataLoading(),
              ListDataLoading(),
              ListDataLoading(),
            ],
          );
  }
}
