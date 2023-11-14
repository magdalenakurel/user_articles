import 'package:flutter_test/flutter_test.dart';
import 'package:user_articles/domain/models/author_model.dart';

void main() {
  test('Should getter name return first and second name combinet', () {
    // 1
    final model = AuthorModel(1, '', 'Kamil', 'Kowalski');

    // 2
    final result = model.name;

    // 3
    expect(result, 'Kamil Kowalski');
  });
}
