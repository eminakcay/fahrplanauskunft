import 'package:fahrplanauskunft/features/search/data/data_sources/remote/api_service.dart';
import 'package:fahrplanauskunft/features/search/domain/entities/start_point.dart';
import 'package:fahrplanauskunft/features/search/domain/repository/start_point_repository.dart';

class StartPointRepositoryImpl implements StartPointRepository {
  final ApiService _apiService;
  const StartPointRepositoryImpl(this._apiService);

  @override
  Future<List<StartPoint>> getStartPoints(String searchedWord) async {
    return await _apiService.fetchStartPoints(searchedWord);
  }
}
