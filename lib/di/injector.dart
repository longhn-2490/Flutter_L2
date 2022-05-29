import 'package:dio/dio.dart';
import 'package:flutter_lession_2/ui/detail/detail_view_model.dart';
import 'package:flutter_lession_2/ui/home/home_view_model.dart';
import 'package:get_it/get_it.dart';

import '../config/utils/constants.dart';
import '../data/remote/api/movie_api.dart';
import '../data/remote/builder/dio_builder.dart';
import '../data/repository/impl/movie_repository_impl.dart';
import '../data/repository/movie_repository.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(
      DioBuilder.getInstance(options: BaseOptions(baseUrl: baseUrl)));

  // Dependencies
  injector.registerSingleton<MovieApi>(MovieApi(injector()));
  injector.registerSingleton<MovieRepository>(
      MovieRepositoryImpl(injector()));

  // ViewModels
  injector.registerFactory<HomeViewModel>(() => HomeViewModel(injector()));
  injector.registerFactory<DetailViewModel>(() => DetailViewModel(injector()));
}
