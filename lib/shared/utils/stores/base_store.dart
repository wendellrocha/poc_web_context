import 'package:flutter/foundation.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../utils.dart';

abstract class BaseNotifierStore<Data extends Object> extends Store<Data> {
  BaseNotifierStore(super.initialState);

  @protected
  Future<void> call(
    Future<dynamic> Function() callback, {
    bool treatLoader = true,
  }) async {
    if (treatLoader) setLoading(true, force: true);
    try {
      final condition = Utils.isFunctionVoid(callback) ||
          Utils.getFunctionType(callback) is! Data;

      if (condition) {
        await callback();
        return;
      }

      update(await callback() as Data, force: true);
    } on Error catch (e) {
      setError(e);
    } finally {
      if (treatLoader) setLoading(false, force: true);
    }
  }
}
