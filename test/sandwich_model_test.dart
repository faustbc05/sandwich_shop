import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('sandwich model tests', () {
    test('creates Sandwich instance with given properties', () {
      const sandwich = Sandwich(
        id: 'vegetarian',
        name: 'vegetarian sub',
        description: 'has loads of vegetables and things',
        price: 5.25,
        imagePath: 'assets/images/six-inch.jpg',
      );

      expect(sandwich.id, 'vegetarian');
      expect(sandwich.name, 'vegetarian sub');
      expect(sandwich.description, 'has loads of vegetables and things');
      expect(sandwich.imagePath, 'assets/images/six-inch.jpg');
    });
    test(
      'formattedPrice returns price prefixed with pound sign and two decimals',
      () {
        const sandwich = Sandwich(
          id: 'footlong',
          name: 'footlong sub',
          description: 'a sub of size one foot',
          price: 3.9,
          imagePath: 'assets/images/footlong.jpg',
        );

        expect(sandwich.formattedPrice, '£3.90');
      },
    );
  });
}
