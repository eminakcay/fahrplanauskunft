import 'package:fahrplanauskunft/features/search/data/models/start_point_model.dart';

class StartPoint {
  final String id;
  final String name;
  final String disassembledName;
  final List<double> coord;
  final String type;

  StartPoint({
    required this.id,
    required this.name,
    required this.disassembledName,
    required this.coord,
    required this.type,
  });

  factory StartPoint.fromModel(StartPointModel model) {
    return StartPoint(
      id: model.id ??= '',
      name: model.name ??= '',
      disassembledName: model.disassembledName ??= '',
      coord: model.coord ??= [],
      type: model.type ??= '',
    );
  }
}
