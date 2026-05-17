import 'package:flutter/material.dart';

class AlertDetailsScreen extends StatelessWidget {

  final String alertText;

  const AlertDetailsScreen({
    super.key,
    required this.alertText,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xff0B1020),

      body: SafeArea(

        child: Padding(

          padding:
              const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 30,
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              // TITLE
              Row(
                children: [

                  Container(
                    height: 55,
                    width: 55,

                    decoration: BoxDecoration(

                      borderRadius:
                          BorderRadius.circular(18),

                      gradient:
                          const LinearGradient(
                        colors: [
                          Color(0xff8B5CF6),
                          Color(0xffEC4899),
                          Color(0xffF59E0B),
                        ],
                      ),
                    ),

                    child: const Icon(
                      Icons.notifications_active_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 16),

                  const Expanded(
                    child: Text(
                      "Alert Details",

                      overflow:
                          TextOverflow.ellipsis,

                      style: TextStyle(
                        fontSize: 30,
                        fontWeight:
                            FontWeight.bold,

                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              // ALERT CARD
              Container(

                width: double.infinity,

                padding:
                    const EdgeInsets.all(24),

                decoration: BoxDecoration(

                  color: const Color(0xff151B2D),

                  borderRadius:
                      BorderRadius.circular(28),

                  border: Border.all(
                    color:
                        Colors.white.withOpacity(.05),
                  ),
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    const Text(
                      "Scheduled Alert",

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight:
                            FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Text(
                      alertText,

                      style: TextStyle(
                        color:
                            Colors.white.withOpacity(.9),

                        fontSize: 20,

                        height: 1.7,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}