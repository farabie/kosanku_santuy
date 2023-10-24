part of 'widgets.dart';

class CustomShimmerCity extends StatelessWidget {
  const CustomShimmerCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: <Widget>[
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: greyColor,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 15,
                  color: greyColor,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 15,
                  color: greyColor,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 15,
                  color: greyColor,
                ),
              ],
            )
          ],
        ),
        Shimmer(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Colors.white.withOpacity(0),
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0),
            ],
            stops: const [0.45, 0.5, 0.55],
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: greyColor,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 15,
                    color: greyColor,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 15,
                    color: greyColor,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 15,
                    color: greyColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
