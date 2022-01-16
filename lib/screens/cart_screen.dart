import 'package:flutter/material.dart';
import '../providers/orders_provider.dart';
import '../providers/cart_provider.dart' show Cart;
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  //SizedBox(width: 10),
                  Chip(
                    label: Text(
                      '\$${cart.total.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline6.color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false)
                            .addOrder(cart.items.values.toList(), cart.total);
                        cart.clear();
                      },
                      child: Text('Order Now!'))
                ],
              ),
              padding: const EdgeInsets.all(8),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
                  itemCount: cart.itemCount,
                  itemBuilder: (ctx, i) {
                    return CartItem(
                        id: cart.items.values.toList()[i].id,
                        productId: cart.items.keys.toList()[i],
                        title: cart.items.values.toList()[i].title,
                        price: cart.items.values.toList()[i].price,
                        quantity: cart.items.values.toList()[i].quantity);
                  })),
        ],
      ),
    );
  }
}
