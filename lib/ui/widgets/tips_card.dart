part of 'widgets.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;
  const TipsCard({
    super.key,
    required this.tips,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          tips.imageUrl,
          width: 80,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              tips.nameTips,
              style: blackTextFont.copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Updated ${tips.dateTips}",
              style: greyTextFont.copyWith(color: greyColor3),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_right,
            color: greyColor,
          ),
        )
      ],
    );
  }
}
