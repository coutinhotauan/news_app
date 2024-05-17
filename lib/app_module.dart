import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/features/home/home_module.dart';
import 'package:news_app/features/search_news/search_module.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

class AppModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addInstance<HttpWithMiddleware>(
      HttpWithMiddleware.build(
        middlewares: [
          HttpLogger(logLevel: LogLevel.BODY),
        ],
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.module("/", module: HomeModule());
    r.module("/search", module: SearchModule());
  }
}
