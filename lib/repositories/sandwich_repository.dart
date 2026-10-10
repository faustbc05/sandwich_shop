import 'package:sandwich_shop/models/sandwich.dart';

class SandwichRepository {
  List<Sandwich> getSandwiches() {
    return const [
      Sandwich(
        id: 'footlong',
        name: 'Footlong Sub',
        description: 'A sandwich that is 1 foot long',
        price: 5.99,
        imagePath: 'assets/images/footlong.jpg',
      ),
      Sandwich(
        id: 'six-inch',
        name: 'Six-Inch Sub',
        description: 'a sandwich that measures to the length of 6 inches',
        price: 4.50,
        imagePath: 'assets/images/six-inch.jpg',
      ),
    ];
  }
}
