import 'package:dartz/dartz.dart';
import 'package:flutter_triple/flutter_triple.dart';

class CustomEitherAdapter<L, R> implements EitherAdapter<L, R> {
  final Either<L, R> usecase;
  const CustomEitherAdapter(this.usecase);

  @override
  T fold<T>(T Function(L l) leftF, T Function(R r) rightF) {
    return usecase.fold(leftF, rightF);
  }

  static Future<EitherAdapter<L, R>> adapter<L, R>(
      Future<Either<L, R>> usecase) {
    return usecase.then((value) => CustomEitherAdapter(value));
  }
}
