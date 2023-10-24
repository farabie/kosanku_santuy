import 'package:flutter/material.dart';
import 'package:kosanku_santuy/providers/providers.dart';
import 'package:kosanku_santuy/services/services.dart';
import 'package:kosanku_santuy/ui/pages/pages.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const KosanKuSantuy());
}

class KosanKuSantuy extends StatelessWidget {
  const KosanKuSantuy({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<auth.User?>.value(
      initialData: null,
      value: AuthServices.userStream,
      child: ChangeNotifierProvider(
        create: (context) => SpaceProvider(),
        child: const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashPage(),
        ),
      ),
    );
  }
}
