part of 'modal_widget.dart';

class _BottomDialogWidget extends StatelessWidget {
  final String title;
  final String text;
  final String assetImage;
  final String buttonOkTitle;
  final Function buttonOkCallback;
  final String? buttonCancelTitle;
  final Function? buttonCancelCallback;
  final double height;
  final double width;
  final double? modalWidth;
  final double? modalHeight;
  final bool hasOptions;

  const _BottomDialogWidget({
    Key? key,
    required this.title,
    required this.text,
    required this.assetImage,
    required this.buttonOkTitle,
    required this.buttonOkCallback,
    this.buttonCancelTitle,
    this.buttonCancelCallback,
    required this.height,
    required this.width,
    this.modalWidth,
    this.modalHeight,
    this.hasOptions = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: modalWidth ?? context.querySize.width,
      height: modalHeight,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: 8,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(assetImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: hasOptions
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SolidButtonWidget(
                              useUpperCase: false,
                              title: buttonCancelTitle!,
                              color: context.theme.colorScheme.primary,
                              callback: () => buttonCancelCallback!.call(),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: BorderButtonWidget(
                              color: context.theme.colorScheme.primary,
                              title: buttonOkTitle,
                              callback: () => buttonOkCallback.call(),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: SolidButtonWidget(
                          useUpperCase: false,
                          title: buttonOkTitle,
                          color: context.theme.colorScheme.primary,
                          callback: () => buttonOkCallback.call(),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
