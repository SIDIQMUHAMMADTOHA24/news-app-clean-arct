import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/theme.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/pages/home_pages.dart';
import 'package:news_app/injection.dart' as locator;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator.sl<NewsBloc>(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.light().copyWith(primaryColor: kWhiteColor),
        debugShowCheckedModeBanner: false,
        home: const HomePages(),
      ),
    );
  }
}
