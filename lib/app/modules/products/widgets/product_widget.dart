import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '/shared/utils/utils.dart';
import '../domain/entities/product_model.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel item;
  const ProductWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => Modular.to.pushNamed(
          'product/${item.id}/${item.title}',
          arguments: item,
          forRoot: true,
        ),
        child: SizedBox(
          height: 285,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                  child: Image.network(
                    item.thumbnail!,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        item.title!,
                        style: context.theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        item.description!,
                        maxLines: 2,
                        style: context.theme.textTheme.bodySmall!.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 8,
                            child: Text(
                              Utils.currencyFormat(item.price!),
                              style: context.theme.textTheme.titleMedium,
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Container(
                              height: 25,
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  '-${item.discountPercentage}%',
                                  style: context.theme.textTheme.labelSmall,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
