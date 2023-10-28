import 'package:fahrplanauskunft/features/search/domain/usecases/search_start_point_use_case.dart';
import 'package:fahrplanauskunft/core/utils/app_context.dart';
import 'package:get_it/get_it.dart';

import 'features/search/data/data_sources/remote/api_service.dart';
import 'features/search/data/repository/start_point_repository_impl.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  //App Context
  locator.registerSingleton<AppContext>(AppContext());

  //Services
  locator.registerSingleton<ApiService>(ApiService(locator()));

  //Repositories
  locator.registerSingleton<StartPointRepositoryImpl>(
      StartPointRepositoryImpl(locator()));

  // UseCases
  locator.registerSingleton<SearchStartPointUseCase>(
      SearchStartPointUseCase(locator(), locator()));
}
