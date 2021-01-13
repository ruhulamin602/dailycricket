import 'package:daily_cricket/src/bloc/movie/article.dart';
import 'package:daily_cricket/src/bloc/movie/featured_article.dart';
import 'package:daily_cricket/src/providers/bottom_navigation_bar_provider.dart';
import 'package:daily_cricket/src/repository/api_repository.dart';
import 'package:daily_cricket/src/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ArticleCubit>(
          create: (BuildContext context) {
            return ArticleCubit(apiRepository: APIRepository());
          },
          child: HomeScreen(),
        ),
        BlocProvider<FeaturedArticleCubit>(
          create: (BuildContext context) {
            return FeaturedArticleCubit(apiRepository: APIRepository());
          },
          child: HomeScreen(),
        ),
        
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        darkTheme: ThemeData.dark(),
        home: HomeScreen(),
      ),
    );
  }
}
