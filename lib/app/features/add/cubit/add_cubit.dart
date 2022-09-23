import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveller/app/domain/repositories/items_repository.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this._itemsRepository) : super(const AddState());

  final ItemsRepository _itemsRepository;

  Future<void> add(
    String title,
    String imageURL,
    DateTime releaseDate,
  ) async {
    try {
      await _itemsRepository.add(title, imageURL, releaseDate);
      //firebase przeniesiony do repository
    } catch (error) {
      emit(AddState(errorMessage: error.toString()));
    }
  }
}
