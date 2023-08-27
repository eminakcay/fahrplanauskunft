import 'package:fahrplanauskunft/features/search/domain/entities/start_point.dart';

class StartPointModel {
  String? id;
  bool? isGlobalId;
  String? name;
  String? disassembledName;
  List<double>? coord;
  String? type;
  int? matchQuality;
  bool? isBest;
  List<int>? productClasses;
  LocationParent? parent;
  LocationProperties? properties;

  StartPointModel({
    required this.id,
    required this.isGlobalId,
    required this.name,
    required this.disassembledName,
    required this.coord,
    required this.type,
    required this.matchQuality,
    required this.isBest,
    required this.productClasses,
    required this.parent,
    required this.properties,
  });

  StartPoint toModel() {
    return StartPoint(
      id: id ??= '',
      name: parent!.name ??= '',
      disassembledName: disassembledName ??= '',
      coord: coord ??= [],
      type: type ??= '',
    );
  }

  factory StartPointModel.fromJson(Map<String, dynamic> json) {
    return StartPointModel(
      id: json['id'],
      isGlobalId: json['isGlobalId'],
      name: json['name'],
      disassembledName: json['disassembledName'],
      coord: (json['coord'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      type: json['type'],
      matchQuality: json['matchQuality'],
      isBest: json['isBest'],
      productClasses: (json['productClasses'] ??= [])
          .map((e) => e as int)
          .toList()
          .cast<int>(),
      parent: LocationParent.fromJson(json['parent']),
      properties: LocationProperties.fromJson(json['properties']),
    );
  }
}

class LocationParent {
  String? id;
  String? name;
  String? type;

  LocationParent({
    required this.id,
    required this.name,
    required this.type,
  });

  factory LocationParent.fromJson(Map<String, dynamic>? json) {
    return LocationParent(
      id: json?['id'] ??= '',
      name: json?['name'] ??= '',
      type: json?['type'] ??= '',
    );
  }
}

class LocationProperties {
  String? stopId;

  LocationProperties({
    required this.stopId,
  });

  factory LocationProperties.fromJson(Map<String, dynamic>? json) {
    return LocationProperties(
      stopId: json?['stopId'] ??= '',
    );
  }
}
