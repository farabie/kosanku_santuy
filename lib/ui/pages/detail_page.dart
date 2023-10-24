part of 'pages.dart';

class DetailPage extends StatefulWidget {
  final Space space;
  const DetailPage({super.key, required this.space});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    launchUrl(Uri url) async {
      if (await canLaunchUrl(url)) {
        launchUrl(url);
      } else {
        // throw (url);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    Future<void> showConfirmation() async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Konfirmasi'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Apakah anda ingin menghubungi pemilik kos?'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Batal'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Hubungi'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    launchUrl(Uri.parse("tel:${widget.space.phone}"));
                  },
                ),
              ],
            );
          });
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Image.network(
              widget.space.imageUrl,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 350,
            ),
            ListView(
              children: <Widget>[
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      //NOTE: TITLE
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultMargin,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.space.nameSpace,
                                  style: blackTextFont.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                      text: "\$${widget.space.price}",
                                      style: blueTextFont.copyWith(
                                        fontSize: 16,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "/ month",
                                          style: greyTextFont.copyWith(
                                            fontSize: 16,
                                          ),
                                        )
                                      ]),
                                ),
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  margin: const EdgeInsets.only(left: 2),
                                  child: RatingItem(
                                    index: index,
                                    rating: widget.space.rate,
                                  ),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: defaultMargin,
                        ),
                        child: Text(
                          "Main Facilities",
                          style: blackTextFont.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultMargin),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            MainFacilitiesItem(
                              facility: Facility(
                                imageUrl: "assets/icons/icon_kitchen.png",
                                nameFacility: "Kitchen",
                                totalFacility: widget.space.numberOfKitchens,
                              ),
                            ),
                            MainFacilitiesItem(
                              facility: Facility(
                                imageUrl: "assets/icons/icon_bedroom.png",
                                nameFacility: "Bedroom",
                                totalFacility: widget.space.numberOfBedrooms,
                              ),
                            ),
                            MainFacilitiesItem(
                              facility: Facility(
                                imageUrl: "assets/icons/icon_cupboard.png",
                                nameFacility: "Big Lemari",
                                totalFacility: widget.space.numberOfCupboards,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //NOTE: PHOTOS
                      Padding(
                        padding: const EdgeInsets.only(
                          left: defaultMargin,
                        ),
                        child: Text(
                          "Photos",
                          style: blackTextFont.copyWith(fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: widget.space.photos.map((item) {
                            return Container(
                              margin: EdgeInsets.only(
                                left: defaultMargin,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  item,
                                  width: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
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
                          "Location",
                          style: blackTextFont.copyWith(fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultMargin,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${widget.space.address}\n${widget.space.citySpace}, ${widget.space.countrySpace}",
                              style: greyTextFont,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(
                                  Uri.parse(widget.space.mapURL),
                                );
                                // launchUrl(Uri.parse("qwerrhg"));
                              },
                              child: Image.asset(
                                "assets/icons/icon_location.png",
                                width: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        width: MediaQuery.of(context).size.width -
                            (2 * defaultMargin),
                        child: ElevatedButton(
                          onPressed: () {
                            showConfirmation();
                          },
                          child: Text(
                            "Book Now",
                            style: whiteTextFont.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                )
              ],
            ),
            //NOTE: INI LETAK DIBAWAH AGAR TIDAK TERTUTP DENGAN GAMBAR
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/icons/icon_back.png",
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Image.asset(
                      (isFavorite)
                          ? "assets/icons/icon_favorite_active.png"
                          : "assets/icons/icon_favorite.png",
                      width: 40,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
