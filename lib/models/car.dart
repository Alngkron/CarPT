class Car {
  final int id;
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  Car(
      {required this.name,
      required this.id,
      required this.images,
      required this.rating,
      required this.totalTime});

  factory Car.fromJson(dynamic json) {
    return Car(
      id: json['id'],
      name: json['name'],
      images: json['images'],
      rating: json['rating'].toDouble(),
      totalTime: json['totalTime'],
    );
  }
}
