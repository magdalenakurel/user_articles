// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:flutter/material.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:user_articles/app/injection_container.dart' as _i12;
import 'package:user_articles/data/remote_data_sources/articles_remote_data_source.dart'
    as _i6;
import 'package:user_articles/data/remote_data_sources/authors_remote_data_source.dart'
    as _i8;
import 'package:user_articles/domain/repositories/articles_repository.dart'
    as _i7;
import 'package:user_articles/domain/repositories/authors_repository.dart'
    as _i9;
import 'package:user_articles/features/articles/cubit/articles_cubit.dart'
    as _i11;
import 'package:user_articles/features/home/cubit/home_cubit.dart' as _i10;
import 'package:user_articles/features/home/page/home_page.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.HomePage>(() => _i3.HomePage(key: gh<_i4.Key>()));
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i5.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i6.ArticlesRemoteRetrofitDataSource>(
        () => _i6.ArticlesRemoteRetrofitDataSource(gh<_i5.Dio>()));
    gh.factory<_i7.ArticlesRepository>(() => _i7.ArticlesRepository(
        remoteDataSource: gh<_i6.ArticlesRemoteRetrofitDataSource>()));
    gh.factory<_i8.AuthorsRemoteRetrofitDataSource>(
        () => _i8.AuthorsRemoteRetrofitDataSource(gh<_i5.Dio>()));
    gh.factory<_i9.AuthorsRepository>(() => _i9.AuthorsRepository(
        remoteDataSource: gh<_i8.AuthorsRemoteRetrofitDataSource>()));
    gh.factory<_i10.HomeCubit>(
        () => _i10.HomeCubit(authorsRepository: gh<_i9.AuthorsRepository>()));
    gh.factory<_i11.ArticlesCubit>(() =>
        _i11.ArticlesCubit(articlesRepository: gh<_i7.ArticlesRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i12.RegisterModule {}
