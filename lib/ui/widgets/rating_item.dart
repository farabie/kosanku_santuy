part of 'widgets.dart';

class RatingItem extends StatelessWidget {
  final num index;
  final num rating;
  const RatingItem({
    super.key,
    this.index = 0,
    this.rating = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/icons/Icon_star.png",
      width: 20,
      color: index <= rating ? accentColor4 : greyColor,
    );
  }
}
