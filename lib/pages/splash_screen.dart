import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rnd_flutter_app/routes/app_routes.dart';
import 'package:rnd_flutter_app/widgets/custom_progress.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then(
        (value) =>
        {Navigator.pushReplacementNamed(context, AppRoutes.login)});
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: CustomLoadingAnimation(),
    ));
  }
}
