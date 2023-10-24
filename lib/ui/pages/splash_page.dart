part of 'pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
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

  Future<Timer> startTimer() async {
    return Timer(const Duration(seconds: 5), checkFirebaseUser);
  }

  void checkFirebaseUser() {
    final firebaseUser = Provider.of<auth.User?>(context, listen: false);
    print(firebaseUser);
    if (firebaseUser == null) {
      Get.off(() => LoginSosmedPage());
    } else {
      bool isGoogleSignIn = false;
      for (var userInfo in firebaseUser.providerData) {
        if (userInfo.providerId == 'google.com') {
          isGoogleSignIn = true;
          break;
        }
      }
      if (isGoogleSignIn) {
        print('User is authenticated with Google.');
        Get.off(() => HomePage());
      } else {
        print('User is not authenticated with Google.');
        Get.off(() => LoginSosmedPage());
      }
      setState(() {
        isLoading = false;
      });
    }
  }
}
