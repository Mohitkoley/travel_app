import 'package:hive/hive.dart';
import 'package:travel_app/feature/travel/shared/export/trip_features_export.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final List<String> photos;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final String location;

  TripModel({
    required this.title,
    required this.photos,
    required this.description,
    required this.date,
    required this.location,
  });

  //from entity to model
  factory TripModel.fromEntity(Trip trip) {
    return TripModel(
      title: trip.title,
      photos: trip.photos,
      description: trip.description,
      date: trip.date,
      location: trip.location,
    );
  }

  //from model to entity
  Trip toEntity() {
    return Trip(
      title: title,
      photos: photos,
      description: description,
      date: date,
      location: location,
    );
  }

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      title: json['title'],
      photos: List<String>.from(json['photos']),
      description: json['description'],
      date: DateTime.parse(json['date']),
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'photos': photos,
      'description': description,
      'date': date.toIso8601String(),
      'location': location,
    };
  }

  TripModel copyWith({
    String? title,
    List<String>? photos,
    String? description,
    DateTime? date,
    String? location,
  }) {
    return TripModel(
      title: title ?? this.title,
      photos: photos ?? this.photos,
      description: description ?? this.description,
      date: date ?? this.date,
      location: location ?? this.location,
    );
  }
}
