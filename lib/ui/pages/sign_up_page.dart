part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  RegistrationData registrationData;
  SignUpPage({Key? key, required this.registrationData}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fullNameController.text = widget.registrationData.fullName;
    emailController.text = widget.registrationData.email;
  }

  @override
  Widget build(BuildContext context) {
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
                    left: 8,
                  ),
                  child: SizedBox(
                    height: 70,
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
                        nameTextField: "FullName*",
                        hintText: "FullName",
                        controller: fullNameController,
                        isPassword: false,
                      ),
                      const SizedBox(
                        height: 16,
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
                        nameButton: "Sign Up",
                        onTap: () async {
                          if (!(fullNameController.text.trim() != "" &&
                              emailController.text.trim() != "" &&
                              passwordController.text.trim() != "")) {
                            Flushbar(
                              duration: const Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: const Color(0xFFFF5C83),
                              message: "Please fill all the fields",
                            ).show(context);
                          } else if (passwordController.text.length < 6) {
                            Flushbar(
                              duration: const Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: const Color(0xFFFF5C83),
                              message: "Password's length min 6 characters",
                            ).show(context);
                          } else if (!EmailValidator.validate(
                              emailController.text)) {
                            Flushbar(
                              duration: const Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: const Color(0xFFFF5C83),
                              message: "Wrong formatted email address",
                            ).show(context);
                          } else {
                            widget.registrationData = RegistrationData(
                              fullName: fullNameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            );

                            SignInSignUpResult result =
                                await AuthServices.signUp(
                              emailController.text,
                              passwordController.text,
                              fullNameController.text,
                            );
                            if (result.user == null) {
                              print(result.message);
                            } else {
                              print(result.user.toString());

                              Get.offAll(() => HomePage(
                                    registrationData: widget.registrationData,
                                  ));
                            }
                          }
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
                              final result =
                                  await AuthServices.signInWithGoogle();
                              if (result.user != null) {
                                Get.off(() => HomePage(
                                      fullNameSosmed: result.user?.fullName,
                                    ));
                              } else {
                                final errorMessage = result.message ??
                                    "Terjadi kesalahan saat masuk dengan Google";
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(errorMessage),
                                ));
                              }
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
                            "already have an account?",
                            style: blackTextFont.copyWith(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                () => const SignInPage(),
                              );
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
