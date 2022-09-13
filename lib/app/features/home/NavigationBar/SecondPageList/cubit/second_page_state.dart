part of 'second_page_cubit.dart';

class SecondPageState {
  const SecondPageState({
    this.items = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });
  final List<ItemModel> items;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
