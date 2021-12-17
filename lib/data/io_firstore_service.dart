import 'package:cloud_firestore/cloud_firestore.dart';

class IOFirstoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> userDataSave(Map<String, dynamic> data) async {
    _firestore.collection("Users").add(data);
  }

  Stream<QuerySnapshot> getBanner() {
    return _firestore.collection("Banner").snapshots();
  }

  Stream<QuerySnapshot> getCategory() {
    return _firestore.collection("Category").snapshots();
  }

  Stream<QuerySnapshot> getFood() {
    return _firestore.collection("Food").snapshots();
  }

  Stream<QuerySnapshot> getFoodByCategory() {
    return _firestore.collection("Recommended").snapshots();
  }
}
