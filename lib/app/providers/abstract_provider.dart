import 'package:flutter/material.dart';

abstract class AbstractProvider with ChangeNotifier {
  BuildContext context;

  bool loading = true;

  final List<String> _errors = <String>[];
  List<String> get errors => _errors;
  void addError(String error) {
    _errors.add(error);
    notifyListeners();
  }

  AbstractProvider({
    required this.context
  });
}