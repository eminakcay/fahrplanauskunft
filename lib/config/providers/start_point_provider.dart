import 'package:fahrplanauskunft/core/enums/api_error.dart';
import 'package:fahrplanauskunft/features/search/domain/entities/start_point.dart';
import 'package:flutter/material.dart';

class StartPointProvider extends ChangeNotifier {
  List<StartPoint> _results = [];
  ApiError? _apiError;
  bool _isSearched = false;

  List<StartPoint> get results => _results;
  ApiError? get apiError => _apiError;
  bool get isSearched => _isSearched;

  set results(List<StartPoint> startPoints) {
    _results = startPoints;
    _isSearched = false;
    notifyListeners();
  }

  set apiError(ApiError? error) {
    _apiError = error;
    notifyListeners();
  }

  set isSearched(bool isSearched) {
    _isSearched = isSearched;
    notifyListeners();
  }
}
