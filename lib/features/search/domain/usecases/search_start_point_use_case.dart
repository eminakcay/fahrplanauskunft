import 'package:fahrplanauskunft/config/providers/start_point_provider.dart';
import 'package:fahrplanauskunft/core/usecase/usecase.dart';
import 'package:fahrplanauskunft/features/search/data/repository/start_point_repository_impl.dart';
import 'package:fahrplanauskunft/features/search/domain/entities/start_point.dart';
import 'package:fahrplanauskunft/utils/app_context.dart';
import 'package:provider/provider.dart';

class SearchStartPointUseCase implements UseCase<List<StartPoint>, String?> {
  final StartPointRepositoryImpl _repo;
  final AppContext _appContext;

  SearchStartPointUseCase(this._repo, this._appContext);

  @override
  Future<List<StartPoint>> call({params}) async {
    final context = _appContext.navigatorContext;
    final provider = Provider.of<StartPointProvider>(context, listen: false);

    List<StartPoint> startPoints = [];
    provider.isSearched = true;

    if (params != null && params.isNotEmpty) {
      startPoints = await _repo.getStartPoints(params);
      // show first 20 start points
      if (startPoints.length > 20) startPoints = startPoints.sublist(0, 19);
    }

    if (context.mounted) provider.results = startPoints;

    return startPoints;
  }
}
