import 'package:movies_app/modules/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    super.backdropPath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        backdropPath:
            json['backdrop_Path'] ?? '/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg',
        id: json['id'],
      );
}
