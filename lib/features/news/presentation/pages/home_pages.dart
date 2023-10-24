import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/theme.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/widgets/handle_button_menu_press.dart';
import 'package:news_app/features/news/presentation/widgets/list_data_news.dart';
import 'package:provider/provider.dart';
import '../widgets/top_news_recomend.dart';

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
      body: Column(
        children: [
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
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 27),
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
          SizedBox(
            height: 220,
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
                            author: '',
                            title: '',
                            obscarakter: '',
                          );
                        } else if (state is GetDataNewsSuccess) {
                          return HighLightWidget(
                              isEquals: isEquals,
                              author: state.articles[index].author,
                              obscarakter: '•',
                              title: state.articles[index].title);
                        }
                        return const Center(child: Text('Other'));
                      },
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                const Text(
                  'Recommendation',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 27),
                ),
                const Spacer(),
                Text(
                  'View all',
                  style: TextStyle(fontSize: 17, color: kBackgroundButton),
                ),
              ],
            ),
          ),
          const Expanded(
            child: ListDataNews(),
          )
        ],
      ),
    );
  }
}
