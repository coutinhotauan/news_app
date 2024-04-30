import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/features/home/home_module.dart';
import 'package:news_app/features/search_news/search_module.dart';

class AppModule extends Module{
  @override
  void routes(RouteManager r) {
    r.module("/", module: HomeModule());
    r.module("/search", module: SearchModule());
  }
}