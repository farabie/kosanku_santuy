part of 'pages.dart';

class HomePage extends StatelessWidget {
  RegistrationData? registrationData = RegistrationData();
  final String? fullNameFromLogin;
  final String? fullNameSosmed;

  HomePage({
    super.key,
    this.registrationData,
    this.fullNameFromLogin,
    this.fullNameSosmed,
  });

  @override
  Widget build(BuildContext context) {
    String fullName = fullNameFromLogin ??
        fullNameSosmed ??
        (registrationData?.fullName ?? "User");
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: <Widget>[
            //  NOTE:
            SizedBox(
              height: defaultMargin,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: defaultMargin,
              ),
              child: Text(
                "Selamat datang, $fullName",
                style: blackTextFont.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: defaultMargin,
              ),
              child: Text(
                "Mencari kosan dengan santuy",
                style: greyTextFont.copyWith(
                  fontSize: 16,
                  color: greyColor3,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //  NOTE: Popular Cities
            Padding(
              padding: const EdgeInsets.only(
                left: defaultMargin,
              ),
              child: Text(
                "Popular Cities",
                style: blackTextFont.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  const SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    city: City(
                      id: 1,
                      nameCity: "Jakarta",
                      imageUrl: "assets/images/city1.png",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    city: City(
                      id: 2,
                      nameCity: "Bandung",
                      imageUrl: "assets/images/city2.png",
                      isPopular: true,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    city: City(
                      id: 3,
                      nameCity: "Surabaya",
                      imageUrl: "assets/images/city3.png",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    city: City(
                      id: 4,
                      nameCity: "Palembang",
                      imageUrl: "assets/images/city4.png",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    city: City(
                      id: 5,
                      nameCity: "Aceh",
                      imageUrl: "assets/images/city5.png",
                      isPopular: true,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    city: City(
                      id: 6,
                      nameCity: "Bogor",
                      imageUrl: "assets/images/city6.png",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: defaultMargin,
              ),
              child: Text(
                "Recommended Space",
                style: blackTextFont.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            //  NOTE: SPACE CARD
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 22,
              ),
              child: Column(
                children: <Widget>[
                  SpaceCard(
                    space: Space(
                      id: 1,
                      price: 54,
                      rate: 4,
                      imageUrl: "assets/images/space1.png",
                      nameSpace: "Kuretakeso Hott",
                      placeSpace: "Bandung, Germany",
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SpaceCard(
                    space: Space(
                      id: 2,
                      price: 11,
                      rate: 5,
                      imageUrl: "assets/images/space2.png",
                      nameSpace: "Roemah Nenek",
                      placeSpace: "Seattle, Bogor",
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SpaceCard(
                    space: Space(
                      id: 3,
                      price: 20,
                      rate: 3,
                      imageUrl: "assets/images/space3.png",
                      nameSpace: "Darrling How",
                      placeSpace: "Jakarta, Indonesia",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),

            //NOTE: TIPS & Guidelines
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: Text(
                "Tips & Guidance",
                style: blackTextFont.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 21,
              ),
              child: Column(
                children: <Widget>[
                  TipsCard(
                    tips: Tips(
                      id: 1,
                      nameTips: "City Guidelines",
                      imageUrl: "assets/images/tips1.png",
                      dateTips: "20 Apr",
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    tips: Tips(
                      id: 2,
                      nameTips: "Jakarta Fairship",
                      imageUrl: "assets/images/tips2.png",
                      dateTips: "11 Dec",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50 + defaultMargin,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: CustomButton(
                nameButton: "Sign Up",
                onTap: () {
                  AuthServices.signOut();
                  Get.offAll(() => const LoginSosmedPage());
                },
              ),
            ),
            const SizedBox(
              height: 50 + defaultMargin,
            ),
          ],
        ),
      ),
    );
  }
}
