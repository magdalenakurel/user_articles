import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_articles/app/core/enums.dart';
import 'package:user_articles/domain/models/author_model.dart';
import 'package:user_articles/domain/repositories/authors_repository.dart';
import 'package:user_articles/features/home/cubit/home_cubit.dart';

class MockAuthorsRepository extends Mock implements AuthorsRepository {}

void main() {
  late HomeCubit sut;
  late MockAuthorsRepository repository;

  setUp(() {
    repository = MockAuthorsRepository();
    sut = HomeCubit(authorsRepository: repository);
  });

  group('fetchData', () {
    group('success', () {
      setUp(() {
        when(() => repository.getAuthorModels()).thenAnswer(
          (_) async => [
            AuthorModel(1, 'picture1', 'firstName', 'lastName'),
            AuthorModel(2, 'picture1', 'firstName', 'lastName'),
            AuthorModel(3, 'picture1', 'firstName', 'lastName'),
          ],
        );
      });

      blocTest<HomeCubit, HomeState>(
          'emits Status.loading then Status.success with resoults',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: () => [
                HomeState(
                  status: Status.loading,
                ),
                HomeState(
                  status: Status.success,
                  results: [
                    AuthorModel(1, 'picture1', 'firstName', 'lastName'),
                    AuthorModel(2, 'picture1', 'firstName', 'lastName'),
                    AuthorModel(3, 'picture1', 'firstName', 'lastName'),
                  ],
                ),
              ]);
    });

    group('failure', () {
      setUp(() {
        when(() => repository.getAuthorModels()).thenThrow(
          Exception('test-exception-error'),
        );
      });

      blocTest<HomeCubit, HomeState>(
          'emits Status.loading then Status.error with error mesage',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: () => [
                HomeState(
                  status: Status.loading,
                ),
                HomeState(
                  status: Status.error,
                  errorMessage: 'Exception: test-exception-error',
                ),
              ]);
    });
  });
}
