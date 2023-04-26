import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:lottie/lottie.dart';

import '/shared/http/errors/http_error.dart';
import '/shared/resources/resources.dart';
import 'domain/entities/product_model.dart';
import 'products_controller.dart';
import 'products_store.dart';
import 'widgets/product_widget.dart';

class ProductsPage extends StatefulWidget {
  final String title;
  const ProductsPage({Key? key, this.title = 'ProductsPage'}) : super(key: key);
  @override
  ProductsPageState createState() => ProductsPageState();
}

class ProductsPageState extends State<ProductsPage> {
  final ProductsController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<ProductsStore, List<ProductModel>>(
      store: controller.store,
      onLoading: (context) => Center(
        child: LottieBuilder.asset(Lotties.loading),
      ),
      onError: (context, error) {
        if (error is HttpError) {
          return Center(child: Text(error.message!));
        }

        return Center(child: Text(error.toString()));
      },
      onState: (context, state) => ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: state.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: ProductWidget(item: state[index])),
              if (index + 1 <= state.length)
                Flexible(
                  child: ProductWidget(
                    item: state[index + 1],
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
