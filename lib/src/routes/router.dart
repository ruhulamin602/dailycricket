import 'package:auto_route/auto_route_annotations.dart';
import 'package:daily_cricket/src/screens/home.dart';


/*
* Run this command in terminal
* flutter packages pub run build_runner build
* */

/*
* Run this command in terminal to watch auto change
* flutter packages pub run build_runner watch
* */

@CupertinoAutoRouter()
class $Router {
  @initial
  HomeScreen homeScreen;
  
}
