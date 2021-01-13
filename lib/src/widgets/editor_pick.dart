// import 'package:daily_cricket/src/models/articles/articles.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class EditorsPick extends StatelessWidget {
//   final double ctrHeight;

//   final double ctrWidth;
//   final double txtHeight;

//   final double txtWidth;
//   final Articles article;

//   EditorsPick({
//     Key key,
//     this.ctrHeight,
//     this.ctrWidth,
//     this.txtHeight,
//     this.txtWidth,
//     this.article,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 15),
//       padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//       width: ctrWidth ?? 332,
//       height: ctrHeight ?? 160,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         shape: BoxShape.rectangle,
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//               spreadRadius: 1,
//               blurRadius: 2,
//               color: Colors.grey.withOpacity(.1),
//               offset: Offset(0, 5)),
//         ],
//       ),
//       child: Stack(
//         children: <Widget>[
//           Container(
//             padding: const EdgeInsets.all(0),
//             width: ctrWidth,
//             height: ctrHeight,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(30),
//               child: Image.network(
//                 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//                 fit: BoxFit.fill,
//                 width: ctrWidth,
//                 height: ctrHeight,
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             child: ClipRRect(
//               borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
//               child: Container(
//                 width: ctrWidth,
//                 height: txtHeight,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                 ),
//                 padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "article.title",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 14.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       "article.date",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 8.0,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:daily_cricket/src/bloc/movie/featured_article.dart';
import 'package:daily_cricket/src/bloc/movie/result_state.dart';
import 'package:daily_cricket/src/models/articles/articles.dart';
import 'package:daily_cricket/src/services/network_exceptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditorsPick extends StatefulWidget {
  final double ctrHeight;

  final double ctrWidth;
  final double txtHeight;

  final double txtWidth;

  EditorsPick({
    Key key,
    this.ctrHeight,
    this.ctrWidth,
    this.txtHeight,
    this.txtWidth,
  }) : super(key: key);

  @override
  _EditorsPickState createState() => _EditorsPickState();
}

class _EditorsPickState extends State<EditorsPick> {
  @override
  void initState() {
    context.bloc<FeaturedArticleCubit>().loadFeaturedArticle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedArticleCubit, ResultState<Articles>>(
      builder: (BuildContext context, ResultState<Articles> state) {
        return state.when(
          loading: () {
            return Center(child: CircularProgressIndicator());
          },
          idle: () {
            return Container();
          },
          data: (Articles data) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              width: widget.ctrWidth ?? 332,
              height: widget.ctrHeight ?? 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                shape: BoxShape.rectangle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 2,
                      color: Colors.grey.withOpacity(.1),
                      offset: Offset(0, 5)),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(0),
                    width: widget.ctrWidth,
                    height: widget.ctrHeight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        data.image,
                        fit: BoxFit.fill,
                        width: widget.ctrWidth,
                        height: widget.ctrHeight,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(30)),
                      child: Container(
                        width: widget.ctrWidth,
                        height: widget.txtHeight,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              data.date,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 8.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
