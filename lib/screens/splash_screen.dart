import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'create_alert_screen.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),

      () {

        Get.off(
          () => CreateAlertScreen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xff0B1020),

      body: Center(

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            // LOGO
            Container(
              height: 120,
              width: 120,

              decoration: BoxDecoration(

                borderRadius:
                    BorderRadius.circular(35),

                gradient:
                    const LinearGradient(
                  colors: [
                    Color(0xff8B5CF6),
                    Color(0xffEC4899),
                    Color(0xffF59E0B),
                  ],
                ),

                boxShadow: [
                  BoxShadow(
                    color:
                        const Color(0xff8B5CF6)
                            .withOpacity(.4),

                    blurRadius: 30,
                  ),
                ],
              ),

              child: const Icon(
                Icons.notifications_active_rounded,

                color: Colors.white,

                size: 60,
              ),
            ),

            const SizedBox(height: 35),

            // APP NAME
            const Text(
              "Alertly",

              style: TextStyle(
                color: Colors.white,

                fontSize: 38,

                fontWeight: FontWeight.bold,

                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 14),

            // TAGLINE
            Text(
              "Stay notified. Stay ahead.",

              style: TextStyle(
                color:
                    Colors.white.withOpacity(.7),

                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}