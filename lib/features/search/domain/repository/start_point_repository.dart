import 'package:fahrplanauskunft/features/search/domain/entities/start_point.dart';

abstract class StartPointRepository {
  Future<List<StartPoint>> getStartPoints(String searchedWord);
}
