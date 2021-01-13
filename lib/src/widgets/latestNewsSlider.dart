import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:daily_cricket/src/bloc/movie/article.dart';
import 'package:daily_cricket/src/models/articles/articles.dart';
import 'package:daily_cricket/src/services/network_exceptions.dart';
import 'package:daily_cricket/src/widgets/latest_news_slides.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LatestNewsSliders extends StatefulWidget {
  // final List<Widget> listWidget;
  // LatestNewsSliders({this.listWidget});
  @override
  State<StatefulWidget> createState() {
    return _LatestNewsSlidersState();
  }
}


class _LatestNewsSlidersState extends State<LatestNewsSliders> {
  @override
  void initState() {
    context.bloc<ArticleCubit>().loadArticles();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleCubit, ResultState<List<Articles>>>(
        builder: (BuildContext context, ResultState<List<Articles>> state) {
          return state.when(
            loading: () {
              return Center(child: CircularProgressIndicator());
            },
            idle: () {
              return Container();
            },
            data: (List<Articles> data) {
              return CarouselSlider(
      items: data.map((article)=>SlideCard(article:article)).toList(),
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: false,
        aspectRatio: 332 / 200,
      ),
    );
            },
            error: (NetworkExceptions error) {
              return Center(
                  child: Text(NetworkExceptions.getErrorMessage(error)));
            },
          );
        },
      );
    
  }
}
// BlocBuilder<MovieCubit, ResultState<List<Movie>>>(
//         builder: (BuildContext context, ResultState<List<Movie>> state) {
//           return state.when(
//             loading: () {
//               return Center(child: CircularProgressIndicator());
//             },
//             idle: () {
//               return Container();
//             },
//             data: (List<Movie> data) {
//               return CarouselSlider(
//       items: widget.listWidget,
//       options: CarouselOptions(
//         autoPlay: false,
//         enlargeCenterPage: false,
//         aspectRatio: 332 / 167,
//       ),
//     );;
//             },
//             error: (NetworkExceptions error) {
//               return Center(
//                   child: Text(NetworkExceptions.getErrorMessage(error)));
//             },
//           );
//         },
//       ),