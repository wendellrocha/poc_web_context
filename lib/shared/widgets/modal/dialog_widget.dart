// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'modal_widget.dart';

class _DialogWidget extends StatelessWidget {
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

  const _DialogWidget({
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
    return Dialog(
      elevation: 4,
      backgroundColor: context.theme.colorScheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: SizedBox(
        height: modalHeight,
        width: context.isLarge || context.isMedium
            ? modalWidth
            : context.querySize.width,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  const SizedBox(height: 8),
                  Stack(
                    children: <Widget>[
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
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          color: context.theme.textTheme.bodyLarge!.color,
                          iconSize: 32,
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
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
                ],
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 0.5,
                      color: context.theme.dividerColor,
                    ),
                  ),
                ),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
