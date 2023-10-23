part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = true;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 150,
            child: Image.asset('assets/images/logo_kosanku.png'),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Kosanku",
                style: yellowTextFont.copyWith(
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Santuy",
                style: blueTextFont.copyWith(
                  fontSize: 28,
                ),
              ),
            ],
          ),
          (isLoading)
              ? Container(
                  height: 30,
                  width: 30,
                  margin: const EdgeInsets.only(top: 40),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(mainColor),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
