part of 'widgets.dart';

class SpaceCard extends StatelessWidget {
  final Space space;
  const SpaceCard({
    super.key,
    required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: Container(
            width: 130,
            height: 110,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  space.imageUrl,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(37),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/Icon_star.png",
                          width: 22,
                          height: 22,
                        ),
                        Text(
                          "${space.rate}/5",
                          style: whiteTextFont.copyWith(
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              space.nameSpace,
              style: blackTextFont.copyWith(
                fontSize: 18,
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  "\$${space.price}",
                  style: blueTextFont.copyWith(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "/ month",
                  style: greyTextFont.copyWith(
                    fontSize: 16,
                    color: greyColor3,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              space.placeSpace,
              style: greyTextFont.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                color: greyColor3,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
