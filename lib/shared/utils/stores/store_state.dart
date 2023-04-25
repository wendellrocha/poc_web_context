class StoreState<T> {
  final bool success;
  final T data;

  const StoreState(this.success, this.data);

  StoreState<T> copyWith({
    bool? success,
    T? data,
  }) {
    return StoreState<T>(
      success ?? this.success,
      data ?? this.data,
    );
  }

  @override
  String toString() => 'StoreState(success: $success, data: $data)';

  @override
  bool operator ==(covariant StoreState<T> other) {
    if (identical(this, other)) return true;

    return other.success == success && other.data == data;
  }

  @override
  int get hashCode => success.hashCode ^ data.hashCode;
}
