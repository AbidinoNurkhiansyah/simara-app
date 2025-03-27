import 'package:cloud_firestore/cloud_firestore.dart';

class MyFirestore {
  Future<String?> getUsernameById(String id) async {
    try {
      DocumentSnapshot doc =
          await FirebaseFirestore.instance.collection('users').doc(id).get();
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return data['username'];
      } else {
        print("Document does not exist");
        return null;
      }
    } catch (e) {
      print("Error fetching document: $e");
      return null;
    }
  }
}
