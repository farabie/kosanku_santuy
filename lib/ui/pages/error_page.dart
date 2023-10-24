part of 'pages.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/error.png",
                width: 300,
              ),
              const SizedBox(height: 70),
              Text(
                "Where are you going?",
                style: blackTextFont.copyWith(
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                "Seems like the page that you were\nrequested is already gone",
                style: greyTextFont.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Container(
                width: 210,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        (route) => false);
                  },
                  child: Text(
                    "Back to Home",
                    style: whiteTextFont.copyWith(
                      fontSize: 17,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
