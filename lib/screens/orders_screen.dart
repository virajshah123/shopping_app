import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../providers/orders_provider.dart' show Orders;
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders-screen';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Your Orders!'),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (_, i) {
          return OrderItem(orderData.orders[i]);
        },
      ),
    );
  }
}
