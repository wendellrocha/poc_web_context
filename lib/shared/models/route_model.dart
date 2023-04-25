class RouteModel {
  final String route;
  final dynamic args;

  const RouteModel({required this.route, this.args});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'route': route,
      'args': args,
    };
  }

  factory RouteModel.fromJson(Map<String, dynamic> map) {
    return RouteModel(
      route: map['route'] as String,
      args: map['args'] as dynamic,
    );
  }

  @override
  String toString() => 'RouteModel(route: $route, args: $args)';

  @override
  bool operator ==(covariant RouteModel other) {
    if (identical(this, other)) return true;

    return other.route == route && other.args == args;
  }

  @override
  int get hashCode => route.hashCode ^ args.hashCode;
}
