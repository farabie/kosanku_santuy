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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Nama:"),
            Text(
              fullName,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              nameButton: "Sign Up",
              onTap: () {
                AuthServices.signOut();
                Get.offAll(() => const LoginSosmedPage());
              },
            )
          ],
        ),
      ),
    );
  }
}
