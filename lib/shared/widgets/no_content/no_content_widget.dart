import 'package:flutter/material.dart';

import '../../resources/resources.dart';
import '../../utils/utils.dart';

class NoContentWidget extends StatelessWidget {
  final String title;
  final String text;
  final double height;
  final double width;

  const NoContentWidget({
    Key? key,
    required this.title,
    this.height = 250,
    this.width = 250,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: context.querySize.width,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: height,
              width: width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.noData),
                ),
              ),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
