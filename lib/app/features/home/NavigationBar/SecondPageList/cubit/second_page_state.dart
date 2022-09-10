part of 'second_page_cubit.dart';

class SecondPageState {
  const SecondPageState({
    this.items,
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });
  final QuerySnapshot<Map<String, dynamic>>? items;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
