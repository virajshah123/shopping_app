import 'package:flutter/material.dart';
import '../providers/products_provider.dart';
import 'package:provider/provider.dart';

import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFav;

  ProductsGrid(this.showFav);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final loadedProducts =
        showFav ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) {
          return ChangeNotifierProvider.value(
            value: loadedProducts[index],
            child: ProductItem(
                // loadedProducts[index].id,
                // loadedProducts[index].title,
                // loadedProducts[index].imageUrl,
                ),
          );
        });
  }
}
