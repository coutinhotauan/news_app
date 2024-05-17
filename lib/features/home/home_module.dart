import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/app_module.dart';
import 'package:news_app/features/home/data/datasource/home_datasource.dart';
import 'package:news_app/features/home/data/repository/home_repository_impl.dart';
import 'package:news_app/features/home/domain/repository/home_repository.dart';
import 'package:news_app/features/home/domain/usecases/get_headlines_usecase.dart';
import 'package:news_app/features/home/presentation/controllers/home/home_cubit.dart';
import 'package:news_app/features/home/presentation/pages/home_page.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(Injector i) {
    //datasource
    i.addSingleton<HomeDatasource>(HomeDatasourceImpl.new);

    //repository
    i.addSingleton<HomeRepository>(HomeRepositoryImpl.new);

    //usecases
    i.addSingleton<GetHeadlines>(GetHeadlines.new);

    //controller
    i.addSingleton<HomeCubit>(
      HomeCubit.new,
      config: BindConfig(
        onDispose: (cubit) => cubit.close(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      "/",
      child: (context) => HomePage(
        homeCubit: Modular.get<HomeCubit>(),
      ),
    );
  }
}
