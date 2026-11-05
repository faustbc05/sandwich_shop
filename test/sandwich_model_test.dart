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

    test('JSON conversion preserves every sandwich field', () {
      final Map<String, dynamic> data = <String, dynamic>{
        'id': 'veggie',
        'name': 'Veggie Sub',
        'description': 'Fresh vegetables',
        'price': 5.50,
        'imagePath': 'assets/images/six-inch.jpg',
      };

      final Sandwich sandwich = Sandwich.fromJson(data);
      expect(sandwich.id, 'veggie');
      expect(sandwich.name, 'Veggie Sub');
      expect(sandwich.description, 'Fresh vegetables.');
      expect(sandwich.price, 5.50);
      expect(sandwich.imagePath, 'assets/images/six-inch.jpg');
    });

    test('fromJson accepts a whole-number price', () {
      final Map<String, dynamic> data = <String, dynamic>{
        'id': 'test',
        'name': 'Test Sub',
        'description': 'Test Sandwich',
        'price': 5,
        'imagePatch': 'assets/images/footlong.jpg',
      };
      final Sandwich sandwich = Sandwich.fromJson(data);
      expect(sandwich.price, 5.0);
      expect(sandwich.price, isA<double>());
    });
  });
}
