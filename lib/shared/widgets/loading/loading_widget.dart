import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../resources/resources.dart';
import '../../utils/utils.dart';

bool _isShowing = false;
BuildContext? _context;
bool _barrierDismissible = false;
bool _useRootNavigator = false;

class LoadingWidget {
  _Loading? _loading;

  LoadingWidget({
    required bool isDismissible,
    required BuildContext context,
    bool useRootNavigator = false,
  }) {
    _barrierDismissible = isDismissible;
    _context = context;
    _useRootNavigator = useRootNavigator;
  }

  bool get isShowing => _isShowing;

  bool hide() {
    try {
      if (_isShowing) {
        _isShowing = false;
        Future.delayed(
          const Duration(milliseconds: 500),
          () => Navigator.of(_context!).pop(),
        );
        return true;
      }
      'LoadingWidget already dismissed'.log;
      return false;
    } catch (e) {
      'Seems there is an issue dismissing LoadingWidget'.log;
      return false;
    }
  }

  void show() {
    try {
      if (!_isShowing) {
        _isShowing = true;
        _loading = const _Loading();
        showDialog(
          context: _context!,
          useRootNavigator: _useRootNavigator,
          builder: (BuildContext context) {
            return WillPopScope(
              onWillPop: () async => _barrierDismissible,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Dialog(
                  insetPadding: const EdgeInsets.all(0),
                  elevation: 4,
                  backgroundColor: Colors.transparent,
                  insetAnimationCurve: Curves.easeInOut,
                  insetAnimationDuration: const Duration(milliseconds: 100),
                  child: _loading,
                ),
              ),
            );
          },
        );
        'Loading shown'.log;
      } else {
        'Loading already shown/showing'.log;
      }
    } catch (e) {
      _isShowing = false;
      'Exception while showing the loading'.log;
      e.log;
    }
  }
}

class _Loading extends StatefulWidget {
  const _Loading();

  @override
  State<_Loading> createState() => _LoadingState();
}

class _LoadingState extends State<_Loading> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.querySize.width,
      height: context.querySize.height,
      child: Center(
        child: Lottie.asset(Lotties.loading),
      ),
    );
  }
}
