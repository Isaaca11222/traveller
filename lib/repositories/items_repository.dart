import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveller/models/item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ItemsRepository {
  Stream<List<ItemModel>> getItemsStream() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    //provide infomation about user ID and his account at framework
    //question mark because user musn't be always logged in
    if (userId == null) {
      throw Exception('User is not logged in');
    }

    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('items')
        .orderBy('release_date')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return ItemModel(
          id: doc.id,
          title: doc['title'],
          imageURL: doc['image_url'],
          relaseDate: (doc['release_date'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }

  Future<void> delete({required String id}) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    //provide infomation about user ID and his account at framework
    //question mark because user musn't be always logged in
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('items')
        .doc(id)
        .delete();
  }

  Future<ItemModel> get({required String id}) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    //provide infomation about user ID and his account at framework
    //question mark because user musn't be always logged in
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('items')
        .doc(id)
        .get();
    return ItemModel(
      id: doc.id,
      title: doc['title'],
      imageURL: doc['image_url'],
      relaseDate: (doc['release_date'] as Timestamp).toDate(),
    );
  }

  Future<void> add(
    String title,
    String imageURL,
    DateTime releaseDate,
  ) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    //provide infomation about user ID and his account at framework
    //question mark because user musn't be always logged in
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('items')
        .add(
      {
        'title': title,
        'image_url': imageURL,
        'release_date': releaseDate,
      },
    );
  }
}
