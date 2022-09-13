import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveller/models/item_model.dart';
import 'package:traveller/repositories/items_repository.dart';

part 'second_page_state.dart';

class SecondPageCubit extends Cubit<SecondPageState> {
  SecondPageCubit(this._itemsRepository) : super(const SecondPageState());

  final ItemsRepository _itemsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _itemsRepository.getItemsStream().listen(
      (items) {
        emit(SecondPageState(items: items));
      },
    )..onError(
        (error) {
          emit(const SecondPageState(loadingErrorOccured: true));
        },
      );
  }

  Future<void> remove({required String documentID}) async {
    try {
      await _itemsRepository.delete(id: documentID);
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
