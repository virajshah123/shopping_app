import 'package:flutter/material.dart';
import './edit_product_screen.dart';
import '../widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = './user-product';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (_, i) => Column(
            children: <Widget>[
              UserProductItem(
                productData.items[i].title,
                productData.items[i].imageUrl,
              ),
              Divider(),
            ],
          ),
          itemCount: productData.items.length,
        ),
      ),
    );
  }
}
