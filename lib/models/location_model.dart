class LocationModel {
  final String name;
  final String image;
  final String shortDetail;

  LocationModel({required this.name , required this.image , required this.shortDetail});

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
      name: json['name'],
      image: json['image'],
      shortDetail: json['short-detail'],
  );
}
