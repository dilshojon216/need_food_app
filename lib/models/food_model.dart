import 'package:cloud_firestore/cloud_firestore.dart';

class Foods {
  final String? foodName;
  final String? foodImage;
  final String? foodPrice;
  final String? foodDescription;

  Foods({
    this.foodName,
    this.foodImage,
    this.foodPrice,
    this.foodDescription,
  });

  factory Foods.fromJson(Map<String, dynamic> json) {
    return Foods(
      foodName: json['food_name'],
      foodImage: json['food_image'],
      foodPrice: json['food_price'],
      foodDescription: json['food_desc'],
    );
  }

  factory Foods.fromSnapshot(DocumentSnapshot snapshot) {
    final newPet = Foods.fromJson(snapshot.data() as Map<String, dynamic>);
    return newPet;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['food_name'] = foodName;
    data['food_image'] = foodImage;
    data['food_price'] = foodPrice;
    data['food_desc'] = foodDescription;
    return data;
  }

  @override
  String toString() {
    return 'Foods{foodName: $foodName, foodImage: $foodImage, foodPrice: $foodPrice, foodDescription: $foodDescription}';
  }
}
