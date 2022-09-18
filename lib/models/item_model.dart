import 'package:intl/intl.dart';

class ItemModel {
  ItemModel({
    required this.id,
    required this.title,
    required this.imageURL,
    required this.relaseDate,
  });

  final String id;
  final String title;
  final String imageURL;
  final DateTime relaseDate;

  String daysLeft() {
    return relaseDate.difference(DateTime.now()).inDays.toString();
    //compare 2 diffrent dates ,nowaday and choosen
  }

  String relaseDateFormated() {
    return DateFormat.yMd().format(relaseDate);
  }
}
