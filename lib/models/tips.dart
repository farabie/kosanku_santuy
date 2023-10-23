part of 'models.dart';

class Tips {
  int id;
  String nameTips;
  String imageUrl;
  String dateTips;
  void Function() onPressed;

  Tips({
    this.id = 0,
    this.nameTips = "",
    this.imageUrl = "",
    this.dateTips = "",
    required this.onPressed,
  });
}
