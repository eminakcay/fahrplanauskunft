import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fahrplanauskunft/features/search/presentation/providers/start_point_provider.dart';
import 'package:fahrplanauskunft/core/constants/constants.dart';
import 'package:fahrplanauskunft/core/enums/api_error.dart';
import 'package:fahrplanauskunft/features/search/data/models/start_point_model.dart';
import 'package:fahrplanauskunft/features/search/domain/entities/start_point.dart';
import 'package:fahrplanauskunft/core/utils/app_context.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class ApiService {
  final AppContext _appContext;
  const ApiService(this._appContext);

  Future<List<StartPoint>> fetchStartPoints(String searchedWord) async {
    final provider = Provider.of<StartPointProvider>(
      _appContext.navigatorContext,
      listen: false,
    );

    final uri = Uri.parse('$BASE_URL$PATH$searchedWord');
    Response? response;
    try {
      response = await http.get(uri);
    } on TimeoutException catch (_) {
      provider.apiError = ApiError.timeout;
    } on SocketException catch (_) {
      provider.apiError = ApiError.connection;
    } on Error catch (_) {
      provider.apiError = ApiError.unknown;
    }

    if (response != null && response.statusCode == 200) {
      final mapBody =
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes))
              as Map<String, dynamic>;
      final locations = mapBody['locations'];

      List<StartPoint> startPoints = [];

      for (var location in locations) {
        startPoints.add(StartPointModel.fromJson(location).toModel());
      }
      provider.apiError = null;

      return startPoints;
    } else {
      throw Exception('Failed to fetch start points');
    }
  }
}
