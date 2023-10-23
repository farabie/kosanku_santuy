part of 'widgets.dart';

class CityCard extends StatelessWidget {
  final City city;
  const CityCard({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 105,
        height: 120,
        color: greyColor2,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  width: 120,
                  height: 102,
                  city.imageUrl,
                  fit: BoxFit.cover,
                ),
                (city.isPopular)
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(37),
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/icons/Icon_star.png",
                              width: 22,
                              height: 22,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              city.nameCity,
              style: blackTextFont.copyWith(
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
