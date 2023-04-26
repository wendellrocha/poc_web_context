import 'package:flutter/material.dart';

import '../../../../../shared/utils/utils.dart';
import '../../../../../shared/widgets/default_app_bar/default_app_bar_widget.dart';
import '../../domain/entities/product_model.dart';

class ProductDetailsPage extends StatefulWidget {
  final String title;
  final String id;
  final ProductModel product;
  const ProductDetailsPage({
    Key? key,
    this.title = 'ProductDetailsPage',
    required this.id,
    required this.product,
  }) : super(key: key);

  @override
  ProductDetailsPageState createState() => ProductDetailsPageState();
}

class ProductDetailsPageState extends State<ProductDetailsPage> {
  late final PageController controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(title: widget.title),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                SizedBox(
                  height: 350,
                  child: PageView.builder(
                    itemCount: widget.product.images!.length,
                    pageSnapping: true,
                    controller: controller,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final image = widget.product.images![index];

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOutCubic,
                        margin: EdgeInsets.all(currentIndex == index ? 10 : 20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(image),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: Wrap(
                    spacing: 2,
                    children: widget.product.images!
                        .map(
                          (e) => AnimatedContainer(
                            width: 10,
                            height: 10,
                            duration: const Duration(milliseconds: 500),
                            decoration: BoxDecoration(
                              color: currentIndex ==
                                      widget.product.images!.indexOf(e)
                                  ? context.theme.colorScheme.primary
                                  : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      widget.product.title!,
                      style: context.theme.textTheme.titleLarge,
                    ),
                    const SizedBox(width: 15),
                    Text(
                      widget.product.rating.toString(),
                      style: context.theme.textTheme.titleMedium,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18,
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  widget.product.description!,
                  style: context.theme.textTheme.bodySmall!,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      Utils.currencyFormat(widget.product.price!),
                      style: context.theme.textTheme.titleMedium,
                    ),
                    const SizedBox(width: 15),
                    Container(
                      height: 25,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          '-${widget.product.discountPercentage}%',
                          style: context.theme.textTheme.labelSmall,
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
    );
  }
}
