import 'package:cloud_firestore/cloud_firestore.dart';

class Categoryas {
  final String? name;
  final String? image;

  Categoryas({
    this.name,
    this.image,
  });

  factory Categoryas.fromJson(Map<String, dynamic> json) => Categoryas(
        name: json["category_name"],
        image: json["category_image"],
      );

  factory Categoryas.fromSnapshot(DocumentSnapshot snapshot) {
    final newPet = Categoryas.fromJson(snapshot.data() as Map<String, dynamic>);
    return newPet;
  }
  @override
  String toString() {
    return 'Categoryas{name: $name, image: $image}';
  }
}
