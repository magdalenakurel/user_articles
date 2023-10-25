import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:user_articles/data/remote_data_sources/articles_remote_data_source.dart';
import 'package:user_articles/data/remote_data_sources/authors_remote_data_source.dart';
import 'package:user_articles/domain/repositories/articles_repository.dart';
import 'package:user_articles/domain/repositories/authors_repository.dart';
import 'package:user_articles/features/articles/cubit/articles_cubit.dart';
import 'package:user_articles/features/home/cubit/home_cubit.dart';

final getIT = GetIt.instance;

void configureDependencies() {
  //Bloc
  getIT.registerFactory(() => HomeCubit(authorsRepository: getIT()));
  getIT.registerFactory(() => ArticlesCubit(articlesRepository: getIT()));

//Repositories
  getIT.registerFactory(() => AuthorsRepository(remoteDataSource: getIT()));
  getIT.registerFactory(() => ArticlesRepository(remoteDataSource: getIT()));

  //DataSources
  getIT.registerFactory(() => AuthorsRemoteRetrofitDataSource(Dio()));
  getIT.registerFactory(() => ArticlesRemoteRetrofitDataSource(Dio()));
}
