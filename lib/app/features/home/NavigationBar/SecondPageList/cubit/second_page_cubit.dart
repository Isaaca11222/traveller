import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveller/models/item_model.dart';

part 'second_page_state.dart';

class SecondPageCubit extends Cubit<SecondPageState> {
  SecondPageCubit() : super(const SecondPageState());
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = FirebaseFirestore.instance
        .collection('items')
        .orderBy('release_date')
        .snapshots()
        .listen(
      (items) {
        final itemModels = items.docs.map((doc) {
          return ItemModel(
            id: doc.id,
            title: doc['title'],
            imageURL: doc['image_url'],
            relaseDate: (doc['release_date'] as Timestamp).toDate(),
          );
        }).toList();
        emit(SecondPageState(items: itemModels));
      },
    )..onError(
        (error) {
          emit(const SecondPageState(loadingErrorOccured: true));
        },
      );
  }

  Future<void> remove({required String documentID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('items')
          .doc(documentID)
          .delete();
    } catch (error) {
      emit(
        const SecondPageState(removingErrorOccured: true),
      );
      start();
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
