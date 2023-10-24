import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:intl/intl.dart';

class ListDataNews extends StatelessWidget {
  const ListDataNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is GetDataNewsLoading) {
          return const Center(
            child: Text('Loading'),
          );
        }
        if (state is GetDataNewsSuccess) {
          return ListView.builder(
            physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(top: 0),
            itemCount: state.articles.length,
            itemBuilder: (context, index) {
              final data = state.articles[index];
              DateTime apiDateTime = data.publishedAt;
              String formattedDate =
                  DateFormat('MMMM d, y').format(apiDateTime);
              return Padding(
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
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            data.title,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 15,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.author,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  formattedDate,
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
              );
            },
          );
        }
        return const Center(child: Text('Other'));
      },
    );
  }
}

// Container(
//             height: 30,
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [
//               Colors.grey.withOpacity(0.1),
//               Colors.grey.withOpacity(0.05),
//               Colors.grey.withOpacity(0.02)
//             ])),
//           // ),