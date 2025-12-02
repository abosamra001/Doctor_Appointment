import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arg}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arg);
  }

  Future<dynamic> pushaReplacementNamed(String routeName, {Object? arg}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: arg);
  }

  Future<dynamic> pushAndRemoveUntil(String routeName, RoutePredicate predicate, {Object? arg}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, predicate, arguments: arg);
  }

  void pop() => Navigator.of(this).pop();
}
