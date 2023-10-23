import 'package:flutter/material.dart';
import 'package:kosanku_santuy/ui/pages/pages.dart';

void main() {
  runApp(const KosanKuSantuy());
}

class KosanKuSantuy extends StatelessWidget {
  const KosanKuSantuy({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginSosmedPage(),
    );
  }
}
