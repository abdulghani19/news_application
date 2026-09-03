import 'package:get_it/get_it.dart';
import 'package:news_application/core/network/dio_client.dart';
import 'package:news_application/features/news/bloc/news_bloc.dart';
import 'package:news_application/features/news/data/data_source/real_time_news_data_source.dart';
import 'package:news_application/features/news/data/repositories/news_repository.dart';



final sl = GetIt.instance;


void setupInjection() {


  // Dio

  sl.registerLazySingleton<DioClient>(
    () => DioClient(),
  );



  // Data Source

  sl.registerLazySingleton<RealTimeNewsDataSource>(
    () => RealTimeNewsDataSource(
      sl<DioClient>(),
    ),
  );



  // Repository

  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepository(
      sl<RealTimeNewsDataSource>(),
    ),
  );



  // Bloc

  sl.registerFactory<NewsBloc>(
    () => NewsBloc(
      sl<NewsRepository>(),
    ),
  );


}