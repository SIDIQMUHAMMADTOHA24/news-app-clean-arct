import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/common/theme.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/widgets/handel_button_widget.dart';
import 'package:news_app/features/news/presentation/widgets/list_data_loading_widget.dart';
import 'package:news_app/features/news/presentation/widgets/list_data_news_widget.dart';

import 'package:provider/provider.dart';
import '../../data/models/news_model.dart';
import '../widgets/hightlight_news_widget.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  PageController pageController =
      PageController(initialPage: 2, viewportFraction: 0.9);

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<NewsBloc>(context, listen: false).add(GetDataNewsEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        body: CustomScrollView(
          physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              const SizedBox(
                height: 35,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    HandleMenuButtonPress(iconName: 'menu_bar'),
                    Spacer(),
                    HandleMenuButtonPress(iconName: 'search'),
                    SizedBox(
                      width: 10,
                    ),
                    HandleMenuButtonPress(iconName: 'notif'),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    const Text(
                      'Breaking News',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 27),
                    ),
                    const Spacer(),
                    Text(
                      'View all',
                      style: TextStyle(fontSize: 17, color: kBackgroundButton),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ])),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 280,
                child: PageView.builder(
                  physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                  controller: pageController,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return BlocBuilder<NewsBloc, NewsState>(
                      builder: (context, state) {
                        return AnimatedBuilder(
                          animation: pageController,
                          builder: (context, child) {
                            bool isEquals = false;
                            if (pageController.position.haveDimensions) {
                              isEquals = index == pageController.page;
                            }
                            if (state is GetDataNewsLoading) {
                              return HighLightWidget(
                                isEquals: isEquals,
                              );
                            } else if (state is GetDataNewsSuccess) {
                              //logic for last upload
                              var timeAgo = '';
                              DateTime hours = DateTime.parse(
                                  state.articles[index].publishedAt.toString());
                              DateTime now = DateTime.now();
                              Duration duration = now.difference(hours);
                              if (duration.inDays > 0) {
                                timeAgo = '${duration.inDays} day ago';
                              } else if (duration.inHours > 0) {
                                timeAgo = '${duration.inHours} hours ago';
                              } else if (duration.inMinutes > 0) {
                                timeAgo = '${duration.inMinutes} minuts ago';
                              }
                              return HighLightWidget(
                                isEquals: isEquals,
                                author: state.articles[index].author,
                                obscarakter: '•',
                                title: state.articles[index].title,
                                time: timeAgo,
                              );
                            }
                            return HighLightWidget(isEquals: isEquals);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    const Text(
                      'Recommendation',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 27),
                    ),
                    const Spacer(),
                    Text(
                      'View all',
                      style: TextStyle(fontSize: 17, color: kBackgroundButton),
                    ),
                  ],
                ),
              ),
            ])),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: 1, (context, index) {
                return BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    //handle data loading
                    if (state is GetDataNewsLoading) {
                      return const ListDataWidget();
                    }

                    //handle data success
                    if (state is GetDataNewsSuccess) {
                      final List<Article> articles = state.articles;
                      return Column(
                        children: articles.map((data) {
                          DateTime apiDateTime = data.publishedAt;
                          String formattedDate =
                              DateFormat('MMMM d, y').format(apiDateTime);
                          return ListDataWidget(
                            formattedDate: formattedDate,
                            data: data,
                          );
                        }).toList(),
                      );
                    }

                    //handle data other
                    return const Column(
                      children: [
                        ListDataLoading(),
                        ListDataLoading(),
                        ListDataLoading(),
                      ],
                    );
                  },
                );
              }),
            )
          ],
        ));
  }
}
