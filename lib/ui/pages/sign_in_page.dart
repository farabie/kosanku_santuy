part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    // RegistrationData registrationData = RegistrationData();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 16,
                  ),
                  child: SizedBox(
                    height: 65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset("assets/images/logo_kosanku.png"),
                        const SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Kosanku",
                                style: yellowTextFont.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Santuy",
                                style: blueTextFont.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: defaultMargin,
                    right: defaultMargin,
                    top: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Quick, Fresh, &\nDelicious Cake ",
                        style: blackTextFont.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextField(
                        nameTextField: "Email*",
                        hintText: "Email",
                        controller: emailController,
                        isPassword: false,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        nameTextField: "Password*",
                        hintText: "Password",
                        controller: passwordController,
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 64,
                      ),
                      CustomButton(
                        nameButton: "Sign In",
                        onTap: () async {
                          // if (!(emailController.text.trim() != "" &&
                          //     passwordController.text.trim() != "")) {
                          //   Flushbar(
                          //     duration: const Duration(milliseconds: 1500),
                          //     flushbarPosition: FlushbarPosition.TOP,
                          //     backgroundColor: const Color(0xFFFF5C83),
                          //     message: "Please fill all the fields",
                          //   ).show(context);
                          // } else if (passwordController.text.length < 6) {
                          //   Flushbar(
                          //     duration: const Duration(milliseconds: 1500),
                          //     flushbarPosition: FlushbarPosition.TOP,
                          //     backgroundColor: const Color(0xFFFF5C83),
                          //     message: "Password's length min 6 characters",
                          //   ).show(context);
                          // } else if (!EmailValidator.validate(
                          //     emailController.text)) {
                          //   Flushbar(
                          //     duration: const Duration(milliseconds: 1500),
                          //     flushbarPosition: FlushbarPosition.TOP,
                          //     backgroundColor: const Color(0xFFFF5C83),
                          //     message: "Wrong formatted email address",
                          //   ).show(context);
                          // } else {
                          //   SignInSignUpResult result =
                          //       await AuthServices.signIn(
                          //     emailController.text,
                          //     passwordController.text,
                          //   );

                          //   if (result.user != null) {
                          //     Get.off(() => ProfilePage(
                          //           registrationData: registrationData,
                          //           fullNameFromLogin: result.user?.fullName,
                          //         ));
                          //   } else {
                          //     print(result.message);
                          //   }
                          // }
                        },
                      ),
                      const SizedBox(
                        height: defaultMargin,
                      ),
                      Center(
                        child: Text(
                          "Or Continue With",
                          style: blackTextFont.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: defaultMargin,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          CustomCircleSosmed(
                            imageAsset: "assets/images/logo_facebook.png",
                            onTap: () {},
                          ),
                          CustomCircleSosmed(
                            imageAsset: "assets/images/logo_google.png",
                            onTap: () async {
                              // final result =
                              //     await AuthServices.signInWithGoogle();
                              // if (result.user != null) {
                              //   Get.off(() => ProfilePage(
                              //         fullNameSosmed: result.user?.fullName,
                              //       ));
                              // } else {
                              //   final errorMessage = result.message ??
                              //       "Terjadi kesalahan saat masuk dengan Google";
                              //   ScaffoldMessenger.of(context)
                              //       .showSnackBar(SnackBar(
                              //     content: Text(errorMessage),
                              //   ));
                              // }
                            },
                          ),
                          CustomCircleSosmed(
                            imageAsset: "assets/images/logo_apple.png",
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: defaultMargin,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don’t have an account?",
                            style: blackTextFont.copyWith(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                          GestureDetector(
                            onTap: () async {
                              // Get.to(
                              //   () => SignUpPage(
                              //     registrationData: registrationData,
                              //   ),
                              // );
                            },
                            child: Text(
                              " Sign In ",
                              style: blueTextFont.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
