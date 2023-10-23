part of 'widgets.dart';

class MainFacilitiesItem extends StatelessWidget {
  final Facility facility;
  const MainFacilitiesItem({
    super.key,
    required this.facility,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          facility.imageUrl,
          width: 32,
        ),
        const SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
              text: "${facility.totalFacility}",
              style: blueTextFont.copyWith(
                fontSize: 14,
              ),
              children: [
                TextSpan(
                  text: " ${facility.nameFacility}",
                  style: greyTextFont.copyWith(
                    fontSize: 14,
                  ),
                )
              ]),
        ),
      ],
    );
  }
}
