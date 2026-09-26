import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Faust's Sandwich Shop App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Faust\'s Hoagies'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OrderItemDisplay(10, "six inch"),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => print("Add button pressed"),
                  child: const Text('Add'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => print("Remove button pressed"),
                  child: const Text("Remove"),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add_shopping_cart),
        ),
      ),
    );
  }
}

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 20});

  @override
  State<StatefulWidget> createState() {
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class OrderItemDisplay extends StatelessWidget {
  final String itemType;
  final int quantity;

  const OrderItemDisplay(this.quantity, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text("$quantity $itemType sandwich(es): ${'🥪' * quantity}");
  }
}
